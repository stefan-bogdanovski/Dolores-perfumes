<?php

if(isset($_POST['request']) && $_POST['request'])
{
    $arrayErr = [];
    $username = trim($_POST['username']);
    $password = $_POST['password'];
    $email = $_POST['email'];
    if(!preg_match('/^[A-Z]+[A-z0-9]{5,9}$/', $username))
    {
        array_push($arrayErr, "Invalid username");
    }
    if(!preg_match('/^.{6,}$/', $password))
    {
        array_push($arrayErr, "Invalid password");
    }
    if(!preg_match('/^[a-z]+[0-9a-z\.]*@[a-z]{2,10}(\.[a-z]{2,10})+$/', $email))
    {
        array_push($arrayErr, "Invalid email");
    }
    
    if(!empty($arrayErr))
    {
        header("Content-Type: application/json");
        echo json_encode($arrayErr);
        exit();
    }
    else
    {
        require_once "../../config/connection.php";
        $alreadyMember = $base->prepare("SELECT * FROM user WHERE username = '$username'");
        $alreadyMember->execute();
        $count = $alreadyMember->rowCount();
        if(!$count)
        {
            $password = md5($password);
            $role = 1;
            $insert_query = $base->prepare("INSERT INTO user
            VALUES (null, :username, :passw, :email, :register_time, :user_role)");
            try {
                $success = $insert_query->execute(array(':username' => $username, ':passw' => $password, ':email' => $email, ':register_time' => time(), ':user_role' => $role));
                header("Content-Type: application/json");
                if($success)
                {
                    echo json_encode(200);
                }
            } catch (\Throwable $th) {
                note_error("Insert query registration:" . $th->getMessage());
            }  
        }
        else
        {
            header("Content-Type: application/json");
            echo json_encode("Already member");
        }
   
    }
}
else
{
    http_response_code(404);
}

?>