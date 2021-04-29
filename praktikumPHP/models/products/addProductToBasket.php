<?php
    if(isset($_POST['id']) && isset($_POST['request']) && is_numeric($_POST['id']))
    {
        session_start();
        error_reporting(E_ALL & ~E_NOTICE);
        if(!isset($_SESSION['user']))
        {
            http_response_code(404);
        }
        $id = $_POST['id'];
        $user = $_SESSION['user'];
        $userId = $user[0]->userID;
        $quantity = 1;
        require_once "../../config/connection.php";
        try {
            //CheckIfProductExist
            $check = "SELECT * FROM user_basket ub WHERE ub.price_listID = $id AND ub.userID = $userId";
            $ready = $base->prepare($check);
            $ready->execute();
            $count = $ready->rowCount();
            if($count)
            {
                $quantityArray = select_query("SELECT quantity FROM user_basket ub WHERE ub.price_listID = $id AND ub.userID = $userId");
                //increase product quantity
                $quantity= $quantityArray[0]->quantity;
                $quantity++;
                $prepare_query = "UPDATE user_basket ub
                SET ub.quantity = ?
                WHERE ub.price_listID = ? AND ub.userID = ?";
                $ready = $base->prepare($prepare_query);
                $finish = $ready->execute(array($quantity, $id, $userId));
                if($finish)
                {
                    header("Content-Type: application/json");
                    echo json_encode(200);
                }
                else
                {
                    header("Content-Type: application/json");
                    echo json_encode(400);
                }
            }
            else
            {
                //add product
                 try
                {
                    $insertBasketQuery = "INSERT INTO user_basket VALUES (null, ?,?,?)";
                    $insertBasket = $base->prepare($insertBasketQuery);
                    $success = $insertBasket->execute(array($id, $userId, $quantity));
                    if($success)
                    {
                        header("Content-Type: application/json");
                        $message = 'Product added to basket!'; 
                        $toSend = [ "message" => $message ];
                        echo json_encode($toSend);
                    }
                    else
                    {
                        header("Content-Type: application/json");
                        $message = 'Problem occured while adding product to basket. Please contact administrator.'; 
                        $toSend = [ "message" => $message ];
                        echo json_encode($toSend);
                    }            
                }
                catch(Throwable $ex)
                {
                    note_error("Insert product to basket: " . $ex->getMessage());
                }
            }
        } catch (\Throwable $th) {
            note_error("Increase product quantity: " . $th->getMessage());
        }
        // header("Content-Type: application/json");
        // $message = 'Product added to basket!'; 
        // $toSend = [ "message" => $message ];
        // echo json_encode($toSend);
    }
    else
    {
        http_response_code(400);
    }

?>

