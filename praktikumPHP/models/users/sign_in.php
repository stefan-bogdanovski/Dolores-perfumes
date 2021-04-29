<?php
if(isset($_POST['request']) && $_POST['request'])
    {
        $username = trim($_POST['username']);
        $password = $_POST['pw'];
        $arrayErr = [];
    if(!preg_match('/^[A-Z]+[A-z0-9]{5,9}$/', $username))
        {
            array_push($arrayErr, "Invalid username");
        }
    if(!preg_match('/^.{6,}$/', $password))
        {
            array_push($arrayErr, "Invalid password");
        }
    if(!empty($arrayErr))
        {
            header("Content-Type: application/json");
            echo json_encode($arrayErr);
        }
    else
        {
            $password = md5($password);
            require_once "../../config/connection.php";
            $check_username = $base->prepare("SELECT * FROM user WHERE username = :username");
            $check_username->execute(array(':username' => $username));
            if($check_username->rowCount() == 1)
            {
                $query_check = $base->prepare("SELECT * FROM user WHERE username = :username AND password = :pass");
                try {
                    $query_check->execute(array(':username' => $username, ':pass' => $password));
                    $count = $query_check->rowCount();
                    if($count == 1)
                    {
                        try {
                            $_SESSION['user'] = select_query("SELECT * FROM user WHERE username = '$username' AND password = '$password'");
                            header("Content-Type: application/json");
                            echo json_encode(200);
                        } catch (\Throwable $th) {
                            note_error("Getting user after signing:" . $th->getMessage());
                        }
                    }
                    else
                    {
                        header("Content-Type: application/json");
                        echo json_encode("Incorrect password");
                    }
                } catch (\Throwable $th) {
                    note_error("Sign in check query:" . $th->getMessage());
                }
            }
            else
            {
                header("Content-Type: application/json");
                echo json_encode("Incorrect username");
            }
        }
    }
else
    {
        http_response_code(404);
    }
?>