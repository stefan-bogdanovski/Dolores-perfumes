<?php

    session_start();
    error_reporting(E_ALL & ~E_NOTICE);
    if(isset($_POST['request']) && isset($_POST['id']))
    {
        $id = $_POST['id'];
        $userID = $_SESSION['user'][0]->userID;
        try {
            require_once "../../config/connection.php";
            //get quantity
            $GetQuery = "SELECT ub.quantity FROM user_basket ub WHERE ub.price_listID = $id AND ub.userID = $userID";
            $quantity = select_query($GetQuery)[0]->quantity;
            var_dump($quantity);
            try {
                //set quantity
                $SetQuery = "UPDATE user_basket SET quantity = ? WHERE price_listID = ? AND userID = ?";
                $prepared = $base->prepare($SetQuery);
                $success = $prepared->execute(array(++$quantity, $id, $userID));
                if($success)
                {
                    header("Content-Type: application/json");
                    $message = array("Succesful");
                    echo json_encode($message);
                }
                else
                {
                    header("Content-Type: application/json");
                    $message = array("Unsuccesful");
                    echo json_encode($message);
                }
            } catch (\Throwable $th) {
                note_error("Setting product quantity " . $th->getMessage());
            }
        } catch (\Throwable $th) {
            note_error("Getting product quantity " . $th->getMessage());
        }
    }
    else
    {
        http_response_code(404);
    }

?>
