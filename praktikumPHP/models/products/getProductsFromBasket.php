<?php 
    session_start();
    error_reporting(E_ALL & ~E_NOTICE);
    if(isset($_POST['request']) && isset($_SESSION['user']))
    {
        require_once "../../config/connection.php";
        $userID = $_SESSION['user'][0]->userID;
        try {
            $query = "SELECT * FROM user_basket ub
            INNER JOIN price_list pl
                ON ub.price_listID = pl.price_listID
            INNER JOIN perfume_type_category_size ptcs
                ON pl.perfume_type_category_sizeID = ptcs.perfume_type_category_sizeID
            INNER JOIN perfume_image per_img
                ON ptcs.perfume_imageID = per_img.perfume_imageID
            INNER JOIN perfume_type_category ptc
                ON ptcs.perfume_type_categoryID = ptc.perfume_type_categoryID
            INNER JOIN perfume_type pt
                ON ptc.perfume_typeID = pt.perfume_typeID
            INNER JOIN perfume p
                ON pt.perfumeID = p.perfumeID
            WHERE userID = $userID";
            $items = select_query($query);
            header("Content-Type: application/json");
            echo json_encode($items);
        } catch (\Throwable $th) {
            note_error("Getting products from basket: ".$th->getMessage());
        }
    }
    else
    {
        http_response_code(404);
    }
       
?>