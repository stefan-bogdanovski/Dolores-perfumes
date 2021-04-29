<?php
 function imageConvertToSmall($path){
    $fixedWidth = 50; 
    $image = imagecreatefromjpeg($path);
    list($width, $height) = getimagesize($path);
    $newHeight = $height * $fixedWidth / $width;
    $plate = imagecreatetruecolor($fixedWidth, $newHeight);
    imagecopyresized($plate,$image,0,0,0,0,$fixedWidth,$newHeight,$width,$height);
    $name = getMiniImageName($path);
    imagejpeg($plate, "assets/img/products/" . $name);
    imagedestroy($plate);
 }
 function getMiniImageName($path)
 {
    $array = explode('/', $path);
    $full_name = end($array);
    return "mini-" . $full_name;
 }
 


?>