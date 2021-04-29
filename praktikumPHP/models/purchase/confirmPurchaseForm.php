<?php
    session_start();
    error_reporting(E_ALL & ~E_NOTICE);
    if(isset($_POST['request']))
    {
        require_once "../../config/connection.php";
        $userID = $_SESSION['user'][0]->userID;
       
        //get all products from basket 
        $queryGetProducts = "SELECT * FROM user_basket ub
        INNER JOIN price_list pl
        ON ub.price_listID = pl.price_listID
        WHERE userID = $userID";
        $products = select_query($queryGetProducts);
      
        //make an order
        $address = $_POST['address'];
        $phone = $_POST['phoneNumber'];
        $payment = $_POST['paymentMethod'];
        if(isset($_POST['ccNumber']))
        {
            $ccNumber = $_POST[['ccNumber']];
        }

        try {
            if(isset($ccNumber))
            {
                $insertQuery = "INSERT INTO user_order 
                VALUES (null, null, ?, ?, ?, ?, ?)";
                $ready = $base->prepare($insertQuery);
                $success = $ready->execute(array(time(), $payment, $address, $phone, $ccNumber));
              
                if($success)
                {
                    //insert into common table
                    $lastID = $base->query("SELECT MAX(user_orderID) as max FROM user_order")->fetch()->max;
                 
                    try {
                            $sum = 0;
                            foreach ($products as $key)
                            {
                            $sum += $key->price*$key->quantity;
                            $query = "INSERT INTO user_order_basket
                            VALUES (null, ?, ?)";
                            $prepared = $base->prepare($query);
                            $finished = $prepared->execute(array($lastID, $key->user_basketID));
                            }
                            $queryUpdateSum = "UPDATE user_order SET total_price = ?";
                            $prepareUpdateQuery = $base->prepare($queryUpdateSum);
                            $finish = $prepareUpdateQuery->execute(array($sum));
                            if($finish)
                            {
                                header("Content-Type: application/json");
                                $message = "Order succesfuly made!";
                                echo json_encode($message);
                            }
                    }
                    catch (\Throwable $th) {
                        note_error("Insert into common: ". $th);
                        header("Content-Type: application/json");
                        echo json_encode(401);
                    }
                }
                else
                {
                   header("Content-Type: application/json");
                   echo json_encode(402);
                   
                }
            }
            else
            {
                $insertQuery = "INSERT INTO user_order 
                VALUES (null, null, ?, ?, ?, ?, null)";
                $ready = $base->prepare($insertQuery);
                $success = $ready->execute(array(time(), $payment, $address, $phone));
                if($success)
                {
                      //insert into common table
                    $lastID = $base->query("SELECT MAX(user_orderID) as max FROM user_order")->fetch()->max;
                
                    try {
                            $sum = 0;
                            foreach ($products as $key)
                            {
                            $sum += $key->price*$key->quantity;
                            $query = "INSERT INTO user_order_basket
                            VALUES (null, ?, ?)";
                            $prepared = $base->prepare($query);
                            $finished = $prepared->execute(array($lastID, $key->user_basketID));
                            }
                            $queryUpdateSum = "UPDATE user_order SET total_price = ?";
                            $prepareUpdateQuery = $base->prepare($queryUpdateSum);
                            $finish = $prepareUpdateQuery->execute(array($sum));
                            if($finish)
                            {
                                header("Content-Type: application/json");
                                $message = "Order succesfuly made! Check your email.";
                                echo json_encode($message);
                            }
                    }
                    catch (\Throwable $th) {
                        note_error("Insert into common: ". $th);
                        header("Content-Type: application/json");
                        echo json_encode(401);
                    }
                }
                else
                {
                    header("Content-Type: application/json");
                    echo json_encode(402);
                }
            }
        } catch (\Throwable $th) {
            note_error("Making order: " .$th);
        }
    }
    else
    {
        http_response_code(400);
    }

?>
