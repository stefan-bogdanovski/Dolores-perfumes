<?php

#Settings
define("base_url", "https://127.0.0.1/praktikumPHP");

define("absolute_path", $_SERVER['DOCUMENT_ROOT'] . "/praktikumPHP" . "/");

define("env_file" , absolute_path . "config/.env");

define("log_file", absolute_path . "data/user_access.txt");

define("err_file", absolute_path . "data/errors.txt");
#Database parameters

define("database" , read_environment_variable("database"));
define("server", read_environment_variable("server"));
define("username", read_environment_variable("username"));
define("password", read_environment_variable("password"));

#Getting database parameters
function read_environment_variable($variable_name)
{
    $file = file(env_file);
    $variable_value = "";
    foreach ($file as $key => $value) {
        $line = explode("=", $value);
        if($line[0]==$variable_name)
        {
            $variable_value = explode("!", $line[1])[0];
        }
    }
    return $variable_value;
}

?>