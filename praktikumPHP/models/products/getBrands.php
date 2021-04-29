<?php
if(!isset($_POST['request']))
    {
        require_once "../../config/connection.php";
        $query = "SELECT * FROM brand
        ORDER BY brand_name";
        $brands = select_query($query);
        header("Content-Type: application/json");
        echo json_encode($brands);
    }
else
    {
        http_response_code(404);
    }
 
?>