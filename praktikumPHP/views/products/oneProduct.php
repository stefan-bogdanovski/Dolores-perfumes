<?php
    require_once "models/products/getOneProduct.php";
    if(isset($_GET['id']) && is_numeric($_GET['id']))
    {
        $product = getProduct($_GET['id']);
         if(empty($product))
        {
            var_dump($product);
        }
    } 
   
?>
<div class="container-fluid">
    <div class="row">
        <div class="col s12 m6 l5 center-align">
        <figure>
            <img src="<?= $product[0]->src_normal?>" alt="<?=$product[0]->perfume_name?>" class="responsive-img">       
        </figure>
        </div>
        <div class="col s12 m6 center-align">
            <h5  class="pt-2 center-align">
                <b> <?=$product[0]->brand_name?> - <?=$product[0]->perfume_name?> </b>
            </h5>
            <p> <b> Price: </b> <?=$product[0]->currency?><?=$product[0]->price?></p>
            <p class="mt-2"> <b> Size: </b> <?=$product[0]->value?><?=$product[0]->measurement_unit?></p>
            <p class="mt-2"> <b> Category: </b> <?=$product[0]->category_name?></p>
            <p class="mt-2"> <b> Type: </b> <?=$product[0]->type_name?></p>
            <div class="card white"  id="product_details_card">
                <div class="card-content black-text">
                <span class="card-title black-text center-align">Details:</span>
                <ul>
                    <li><b>Fragrance family: </b> <?=$product[0]->Family?></li>
                    <li class="mt-2"><b>Scent type: </b> <?=$product[0]->Scent?></li>
                    <li class="mt-2">
                        <b>Notes: </b>
                        <?php for($i = 0; $i<count($product); $i++)
                        {
                            if($i < count($product)-1)
                            {
                                echo $product[$i]->note_name . ", ";
                            }
                            else
                            {
                                echo $product[$i]->note_name;
                            }
                        }
                        ?>
                    </li>
                </ul>
                </div>
                <div class="card-action">
                <div class="center-align">
                    <?php if(!isset($_SESSION['user'])):?>
                    <button class="btn-large disabled center-align">Add to cart</button>
                        <br/>
                        <span class="center-align"> <b>Only registered users</b></span>
                    <?php else: ?>
                        <button class="btn-large" id="add_to_basket" data-idProduct="<?=$product[0]->price_listID?>"> Add to cart</button>
                    <?php endif;?>
                </div>
                </div>
            </div>
        </div>
    </div>
</div>
