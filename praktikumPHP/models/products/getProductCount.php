<?php

function countProducts($brand)
{
    if(!$brand)
    {
        $query = "SELECT COUNT(*) as broj
        FROM perfume";
    }
    else
    {
        $query = "SELECT COUNT(*) as broj
        FROM perfume
        WHERE ";
        foreach($brand as $key => $value)
        {
            #Ako nije poslednji brend
            if($key < count($brand) - 1)
            {
                $query .= "brandID = " . $value. " OR ";
            }
            #Ako je poslednji brend
            else
            {
                $query .= "brandID = " . $value;
            }
        }
    }
    return select_query($query);
}

?>