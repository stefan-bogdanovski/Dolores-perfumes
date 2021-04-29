<?php

    if(isset($_POST['request']))
    {
        require_once "../../config/connection.php";
        try {
            $query = "SELECT * FROM payment";
            $methods = select_query($query);
            header("Content-Type: application/json");
            echo json_encode($methods);
        } catch (\Throwable $th) {
            note_error("Getting payment methods: ". $th->getMessage());
        }
    }
    else
    {
        http_response_code(404);
    }
?>
