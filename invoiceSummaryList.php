<?php
include 'config.php';
$output = array();
$query  = 	"SELECT i.id,
					i.date,
					ROUND(SUM(CASE WHEN b.user = 1 THEN b.amount ELSE 0 END),2) AS alex, 
					ROUND(SUM(CASE WHEN b.user = 2 THEN b.amount ELSE 0 END),2) AS manu 
			FROM bills b JOIN invoices i ON b.invoice = i.id 
			WHERE b.deleted = 0 AND b.invoice IS NOT NULL
			GROUP BY b.invoice";
$result = mysqli_query($conn, $query);
if (mysqli_num_rows($result) > 0) {
    while ($row = mysqli_fetch_array($result)) {
        $output[] = $row;
    }
    echo json_encode($output);
}
?>
