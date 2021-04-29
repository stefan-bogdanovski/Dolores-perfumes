<?php

    if(!isset($_SESSION['user']))
    {
        header("Location: index.php");
    }

?>

    <div class="container-fluid">
    <h3 class="header center-align" id="shopping_title"></h3>
        <div class="row" id="shopping_products">
            <div id="shopping_wrapper">
            <table>
                <thead>
                    <tr>
                        <td>
                             <p class="center-align"> image </p>
                        </td>
                        <td>
                             <p class="center-align"> name </p>
                        </td>
                        <td>
                             <p class="center-align"> price </p>
                        </td>
                        <td>
                             <p class="center-align"> quantity </p>
                        </td>
                        <td>
                             <p class="center-align"> add </p>
                        </td>
                        <td>
                             <p class="center-align"> remove </p>
                        </td>
                    </tr>
                </thead>
                <tbody id="products">

                </tbody>
            </table>
            <p class="center-align" id="total_cost"></p>
            <p class="center-align"></p>
            </div>            
        </div>
    </div>
    <?php require_once "modals/purchase.php";?>