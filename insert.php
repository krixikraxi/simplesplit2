<?php
include 'config.php';
$info = json_decode(file_get_contents("php://input"));
if (count($info) > 0) {
    $amount     = mysqli_real_escape_string($conn, $info->amount);
    $notes    = mysqli_real_escape_string($conn, $info->notes);
    $user      = mysqli_real_escape_string($conn, $info->user);
    $btn_name = $info->btnName;
    if ($btn_name == "Insert") {
        $query = "INSERT INTO bills(amount, notes, user) VALUES ('$amount', '$notes', '$user')";
        if (mysqli_query($conn, $query)) {
            echo "Data Inserted Successfully...";
        } else {
            echo 'Failed';
        }
    }
    if ($btn_name == 'Update') {
        $id    = $info->id;
        $query = "UPDATE bills SET amount = '$amount', notes = '$notes', user = '$user' WHERE id = '$id'";
        if (mysqli_query($conn, $query)) {
            echo 'Data Updated Successfully...';
        } else {
            echo 'Failed';
        }
    }
}
?>
