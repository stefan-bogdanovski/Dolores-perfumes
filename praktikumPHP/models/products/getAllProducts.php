<?php

if(!isset($_POST['zahtev']))
    {
        require_once "../../config/connection.php";
        $query = "SELECT * FROM perfume_type_category_size ptcs
        INNER JOIN perfume_type_category ptc
        ON ptcs.perfume_type_categoryID = ptc.perfume_type_categoryID
        INNER JOIN perfume_type pt
        ON ptc.perfume_typeID = pt.perfume_typeID
        INNER JOIN perfume p
        ON pt.perfumeID = p.perfumeID
        INNER JOIN brand b
        ON p.brandID = b.brandID
        INNER JOIN type t
        ON pt.typeID = t.typeID
        INNER JOIN perfume_image p_i
        ON ptcs.perfume_imageID = p_i.perfume_imageID
        INNER JOIN price_list pl
        ON ptcs.perfume_type_category_sizeID = pl.perfume_type_category_sizeID
        INNER JOIN size s
        ON ptcs.sizeID = s.sizeID
        ORDER BY p.perfumeID";
        $products = select_query($query);
        //echo json_encode($products);
        if(!empty($products))
            {
                header("Content-Type: application/json");
                echo json_encode($products);
            }
        else
            {
                header("Content-Type: application/json");
                echo json_encode("Getting products unavailable, contact administrator.");  
            }
    }
else
    {
        http_response_code(404);
    }

?>