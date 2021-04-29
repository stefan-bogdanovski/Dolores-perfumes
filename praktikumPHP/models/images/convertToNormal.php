<?php
 function imageConvertToNormal($path){
    $fixedWidth = 500; 
    $image = imagecreatefromjpeg($path);
    list($width, $height) = getimagesize($path);
    $newHeight = $height * $fixedWidth / $width;
    $plate = imagecreatetruecolor($fixedWidth, $newHeight);
    imagecopyresized($plate,$image,0,0,0,0,$fixedWidth,$newHeight,$width,$height);
    $name = getNormalImageName($path);
    imagejpeg($plate, "assets/img/products/" . $name);
    imagedestroy($plate);
 }
 function getNormalImageName($path)
 {
    $array = explode('/', $path);
    $full_name = end($array);
    return "normal-" . $full_name;
 }
 


?>