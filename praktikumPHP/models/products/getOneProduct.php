<?php

    function getProduct($id)
    {
        $query = "SELECT perfume_name,pl.price_listID, brand_name, category_name, src_normal, src_mini,note_name, price, currency, value, measurement_unit, type_name, fff.name as Family, ff.name as Scent  FROM perfume_type_category_size ptcs
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
        INNER JOIN perfume_type_category_fragrance ptcf
        ON ptcs.perfume_type_categoryID = ptcf.perfume_type_categoryID
        INNER JOIN fragrance_famliy ff
        ON ptcf.fragrance_familyID = ff.fragrance_familyID
        INNER JOIN fragrance_famliy fff
        ON ff.familyID = fff.fragrance_familyID
        INNER JOIN perfume_type_category_note ptcn
        ON ptcs.perfume_type_categoryID = ptcn.perfume_type_categoryID
        INNER JOIN notes n
        ON ptcn.noteID = n.noteID
        INNER JOIN category c
        ON ptc.categoryID = c.categoryID
        WHERE p.perfumeID = $id";
        return select_query($query);
        
    }

?>