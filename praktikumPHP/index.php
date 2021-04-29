<?php
    require "config/connection.php";
 
    ob_start();
  
   
?>

<?php if(isset($_SESSION['wrong_username'])): ?>
<script type="text/javascript"> alert(<?= $_SESSION['wrong_username']?>); </script>
<?php endif; unset($_SESSION['wrong_username']);?>

<?php if(isset($_SESSION['wrong_password'])): ?>
<script type="text/javascript"> alert(<?= $_SESSION['wrong_password']?>); </script>
<?php endif; unset($_SESSION['wrong_password']);?>

<?php if(isset($_SESSION['wrong_email'])): ?>
<script type="text/javascript"> alert(<?= $_SESSION['wrong_email']?>); </script>
<?php endif; unset($_SESSION['wrong_email']);?>

<?php if(isset($_SESSION['SameUsername'])): ?>
<script type="text/javascript"> alert(<?=$_SESSION['SameUsername']?>); </script>
<?php endif; unset($_SESSION['SameUsername']);?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css"/>
    <link rel="stylesheet" type="text/css" href="assets/css/main.css"/>
    <link rel="shortcut icon" href="assets/img/icons/favicon.png"/>
    <!-- JQUERY -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <title >Dolores perfumes</title>
</head>
<body>
     <?php require_once "views/fixed/header.php"; ?>
     <?php if(isset($_GET['view']) && $_GET['view'] == 'shopping_cart'):?>
        <?php require_once "views/" . $_GET['view'] . ".php"?>
     <?php else:?>
        <?php if(!isset($_GET['id'])):?>
            <div class="container-fluid fluid-padding">
                    <div class="row">
                        <h4 class="center-align" id="productsHeaderUp"> Our products! </h4>

                            <div class="col s12 m12 l3" id="filter">
                                <?php require_once "views/filters.php";?>
                            </div>
                            <div class="col s12 m12 l9">
                                <?php require_once "views/products/allProducts.php";?>
                            </div>
                    </div>
                    <script type="text/javascript" src="assets/js/getBrands.js"></script>
                    <script type="text/javascript" src="assets/js/getAllProducts.js"></script>
        <?php else:?>
            <?php
                require_once "views/products/oneProduct.php";
            ?>
            
        <?php endif; ?>
            </div>
    <?php endif; ?>
    <?php require_once "views/fixed/footer.php";?>

<!-- Compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<script type="text/javascript" src="assets/js/register.js"></script>
<script type="text/javascript" src="assets/js/sign_in.js"></script>
<script type="text/javascript" src="assets/js/shopping_cart.js"></script>
<script src="assets/js/main.js"></script>
</body>
</html>