<?php
    
    if(isset($_POST['request']) && !isset($_POST['sort']))
    {
        $brands = $_POST['brand'];
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
        WHERE ";
        foreach($brands as $key => $value)
        {
            #not last brand
            if($key < count($brands) - 1)
            {
                $query .= "b.brandID = " . $value. " OR ";
            }
            #last brand
            else
            {
                $query .= "b.brandID = " . $value;
            }
        }
        $products = select_query($query);
        header("Content-Type: application/json");
        echo json_encode($products);
    }
    else if(isset($_POST['request']) && isset($_POST['sort']))
    {
        $brands = $_POST['brand'];
        $order;
        $sort = $_POST['sort'];
        $order;
          switch ($sort) {
            case '1':
                $order = " ORDER BY pl.price DESC";
                break;
            
            case '2':
                $order = " ORDER BY pl.price ASC";
                break;
            default:
                $order = " ORDER BY p.perfume_name ASC";
                break;
        }
        require_once "../../config/connection.php";
        $brands = $_POST['brand'];
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
        WHERE ";
        foreach($brands as $key => $value)
        {
            #not last brand
            if($key < count($brands) - 1)
            {
                $query .= "b.brandID = " . $value. " OR ";
            }
            #last brand
            else
            {
                $query .= "b.brandID = " . $value;
            }
        }
        $query .= $order;
        $products = select_query($query);
        header("Content-Type: application/json");
        echo json_encode($products);
    }
    else
    {
        http_response_code(404);
    }

?>