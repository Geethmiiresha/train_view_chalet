<form action="manage_rooms.php" method="POST">
    <input type="text" name="room_name" placeholder="Room Name" required>
    <input type="text" name="room_type" placeholder="Type (AC/Non-AC)" required>
    <input type="number" name="price" placeholder="Price" required>
    <button type="submit" name="add_room">Add Room</button>
</form>

<?php
include('../config/db.php'); // Only include the connection here

if (isset($_POST['add_room'])) {
    $name = mysqli_real_escape_string($conn, $_POST['room_name']);
    $type = mysqli_real_escape_string($conn, $_POST['room_type']);
    $price = mysqli_real_escape_string($conn, $_POST['price']);

    $sql = "INSERT INTO rooms (room_name, room_type, price) VALUES ('$name', '$type', '$price')";
    
    if (mysqli_query($conn, $sql)) {
        echo "Room added successfully!";
    } else {
        echo "Error: " . mysqli_error($conn);
    }
}
?>