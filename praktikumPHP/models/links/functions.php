<?php

    function get_nav_links($authorised)
    {
        $query_nav_links = "SELECT l.link_name, l.src from link l
        INNER JOIN link_link_type llt
        ON l.linkID = llt.linkID
        INNER JOIN link_type lt
        ON llt.link_typeID = lt.link_typeID
        INNER JOIN link_authorise la
        ON l.linkID = la.linkID
        INNER JOIN authorise a
        ON a.authoriseID = la.authoriseID
        WHERE lt.type = 'header' AND a.value = $authorised
        ORDER BY la.priority DESC";
        
        return select_query($query_nav_links);  
    }
    function get_social_links()
    {
        $query_social_links = "SELECT l.link_name, l.src from link l
        INNER JOIN link_link_type llt
        ON l.linkID = llt.linkID
        INNER JOIN link_type lt
        ON llt.link_typeID = lt.link_typeID
        WHERE lt.type = 'footer_social'";
        
        return select_query($query_social_links);  
    }
?>