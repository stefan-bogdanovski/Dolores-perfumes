<?php
    session_start();
    error_reporting(E_ALL & ~E_NOTICE);
    if(isset($_POST['request']) && isset($_POST['id']))
    {
        $id = $_POST['id'];
        $userID = $_SESSION['user'][0]->userID;
        try {
            require_once "../../config/connection.php";
            $removeQuery = "DELETE FROM user_basket WHERE price_listID = ? AND userID = ?";
            $prepared = $base->prepare($removeQuery);
            $success = $prepared->execute(array($id, $userID));
            var_dump($success);
            if($success)
            {
                header("Content-Type: application/json");
                echo json_encode("Success");
            }
            else
            {
                header("Content-Type: application/json");
                echo json_encode("Unuccessful");
            }
        } catch (\Throwable $th) {
            note_error("Deleting product from basket: " . $th->getMessage());
        }
    }


?>