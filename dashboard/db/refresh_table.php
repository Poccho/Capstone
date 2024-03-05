<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    header("Location: index.php");
    exit();
}
?>
<html>

<head>
    <!-- Your head content remains unchanged -->
</head>

<body>
    <table id="dynamic-table">
        <thead>
            <tr>
                <th>Coordinates</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // PHP code to fetch coordinates from the database and display them in the table
            include "connection.php";

            if ($conn->connect_error) {
                die("Connection failed: " . $conn->connect_error);
            }

            $sql = "SELECT latitude, longitude, COUNT(*) AS count FROM alert GROUP BY latitude, longitude HAVING COUNT(*) > 1 
                    UNION 
                    SELECT latitude, longitude, COUNT(*) AS count FROM alert GROUP BY latitude, longitude HAVING COUNT(*) = 1";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {
                    $latitude = $row["latitude"];
                    $longitude = $row["longitude"];
                    $count = $row["count"];
                    echo '<tr>
                            <td id="coordinates">' . $latitude . ', ' . $longitude . ' (#' . $count . ')' . '</td>
                            <td>
                                <button id="pin" onclick="pinLocation(' . $latitude . ', ' . $longitude . ')"><i class="fa-solid fa-map-pin fa-bounce fa-lg"></i></button>
                                <button id="remove-route" onclick="removeRoute(' . $latitude . ', ' . $longitude . ')"><i class="fa-solid fa-eraser fa-lg"></i></button>
                                <button id="delete" onclick="remove(' . $latitude . ', ' . $longitude . ')"><i class="fa-regular fa-trash-can fa-lg"></i></button>
                            </td>
                        </tr>';

                }
            } else {
                echo "<tr><td colspan='3' style='text-align: center;'>No coordinates found</td></tr>";
            }

            $conn->close();
            ?>
        </tbody>
    </table>
    <script>
        let routes = []; // Store routes for each set of coordinates
        let permanentHighlight = [];

        // FUNCTIUON FOR PINNING LOCATIONS
        function pinLocation(latitude, longitude) {
            let existingRoute = findRoute(latitude, longitude);
            if (existingRoute) {
                // Route already exists, just set the map view and highlight the table cells
                map.setView([latitude, longitude], 20);
            } else {
                // Route doesn't exist, create a new one
                let route = L.Routing.control({
                    waypoints: [L.latLng(6.073838, 125.115167), L.latLng(latitude, longitude)],
                }).addTo(map);
                let circle = L.circle([latitude, longitude], {
                    color: "red",
                    fillColor: "#f03",
                    fillOpacity: 0.5,
                    radius: 50,
                }).addTo(map);

                // Store the route with corresponding coordinates
                routes.push({ latitude, longitude, route, circle });

                // Set the map view
                map.setView([latitude, longitude], 20);

            }
        }

        function findRoute(latitude, longitude) {
            // Find the route with given coordinates
            return routes.find(route => route.latitude === latitude && route.longitude === longitude);
        }

        function remove(latitude, longitude) {
            let existingRoute = findRoute(latitude, longitude);

            if (existingRoute) {
                // Set the map view to the coordinates before showing the confirmation alert
                map.setView([latitude, longitude], 20);

                // Ask for confirmation using SweetAlert
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Proceed with deletion
                        let xhr = new XMLHttpRequest();
                        xhr.open("POST", "db/delete_coordinates.php", true);
                        xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
                        xhr.onreadystatechange = function () {
                            if (xhr.readyState === XMLHttpRequest.DONE) {
                                if (xhr.status === 200) {
                                    console.log("Connected to delete_coordinates.php successfully");
                                    let response = xhr.responseText;
                                    if (response === "Deletion successful") {
                                        console.log("Database deletion successful");
                                        deleteRoute(latitude, longitude);
                                        Swal.fire(
                                            'Deleted!',
                                            'Your file has been deleted.',
                                            'success'
                                        )
                                    } else {
                                        console.error("Database deletion failed");
                                        Swal.fire(
                                            'Failed!',
                                            'Database deletion failed.',
                                            'error'
                                        )
                                    }
                                } else {
                                    console.error("Connection to delete_coordinates.php failed");
                                    Swal.fire(
                                        'Failed!',
                                        'Connection to server failed.',
                                        'error'
                                    )
                                }
                            }
                        };
                        xhr.send("latitude=" + latitude + "&longitude=" + longitude);
                    }
                });
            } else {
                Swal.fire({
                    icon: 'warning',
                    title: 'Coordinates not pinned',
                    text: 'Coordinates can only be deleted if they are pinned on the map to prevent accidental deletion.',
                    confirmButtonText: 'OK'
                });
            }
        }

        function deleteRoute(latitude, longitude) {
            console.log("Deleting route: Lat - " + latitude + ", Long - " + longitude);

            let indexToDelete = -1;
            // Find the index of the route to delete based on coordinates
            for (let i = 0; i < routes.length; i++) {
                if (routes[i].latitude === latitude && routes[i].longitude === longitude) {
                    indexToDelete = i;
                    break;
                }
            }

            if (indexToDelete !== -1) {
                console.log("Removing route from map");
                // Remove the route and circle from the map
                map.removeControl(routes[indexToDelete].route);
                map.removeLayer(routes[indexToDelete].circle);
                routes.splice(indexToDelete, 1);
                map.setView([6.073838, 125.115167], 100);
                L.marker([6.073838, 125.115167], { icon: fireDepartment }).addTo(map);
            } else {
                console.error("Route not found in routes array");
            }
        }

        function highlightIfPinned(latitude, longitude) {
            let existingRoute = findRoute(latitude, longitude);
            if (existingRoute) {
                // Coordinate is pinned, find and highlight the corresponding table cell
                let table = document.getElementById("dynamic-table");
                let cells = table.getElementsByTagName("td");

                for (let i = 0; i < cells.length; i++) {
                    let coords = cells[i].innerText; // Assuming coordinates are in the cells
                    if (coords.includes(latitude) && coords.includes(longitude)) {
                        cells[i].classList.add("highlighted-cell");
                    }
                }
            }
        }

        function removeRoute(latitude, longitude) {
            let existingRoute = findRoute(latitude, longitude);

            if (existingRoute) {
                // Set the map view to the coordinates before showing the confirmation alert
                map.setView([latitude, longitude], 20);

                // Ask for confirmation using SweetAlert
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, remove it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        // Proceed with deletion
                        deleteRoute(latitude, longitude);
                        Swal.fire(
                            'Deleted!',
                            'Your file has been deleted.',
                            'success'
                        )
                    }
                });
            } else {
                console.warn("Route not found, unable to remove from the map");
            }
        }

        window.onload = function () {
            // Call your function here
            highlightIfPinned();
        };

    </script>

</body>

</html>