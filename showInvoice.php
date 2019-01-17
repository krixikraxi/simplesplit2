<?php
include 'config.php';
$output = array();
$query  = "SELECT u.name, sum(b.amount) AS userSum
				FROM bills b 
				JOIN users u ON b.user = u.id 
				WHERE invoice IS NULL AND b.deleted = 0
				GROUP BY b.user;";
$result = mysqli_query($conn, $query);
if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_array($result)) {
        $output[] = $row;
    }
    echo json_encode($output);
}
?>
