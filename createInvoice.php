<?php
include 'config.php';

$query = "SELECT * FROM bills WHERE invoice IS NULL;";
$result = mysqli_query($conn, $query);
if (mysqli_num_rows($result) <= 0) {
	// there is nothing to update
	echo 'There exists no entry to create a new invoice.';
	return;
}

$queryInsertInvoice = "INSERT INTO invoices (notes) VALUES ('standard note');";
if (mysqli_query($conn, $queryInsertInvoice)) {
	$queryUpdateBills = "UPDATE bills SET invoice = " . mysqli_insert_id($conn) . " WHERE invoice IS NULL AND deleted = 0;";
	if (mysqli_query($conn, $queryUpdateBills)) {
		echo 'New invoice created.';
	} else {
		echo 'Failed to update the bill.';
	}
} else {
    echo 'Failed to insert new invoice.';
}
?>
