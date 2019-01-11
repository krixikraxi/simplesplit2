<?php
include 'config.php';
$output = array();
$query  = "SELECT b.id, b.amount, b.date, b.notes, b.user, u.name FROM bills b JOIN users u ON b.user = u.id WHERE b.billed = 0 AND b.invoice IS NULL ORDER BY b.id;";
$result = mysqli_query($conn, $query);
if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_array($result)) {
        $output[] = $row;
    }
    echo json_encode($output);
}
?> 