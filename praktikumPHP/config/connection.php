<?php

session_start();
require_once "config.php";
note_user_access();
    try {
        $base = new PDO("mysql:host=".server.";dbname=".database,username,password);
        $base->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_OBJ);
        $base->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    }
    catch (Throwable $ex) {
        exit("Connection with database is currently unavailable, please try later.");
    }
    function select_query($query)
    {
        global $base;
        try {
            return $base->query($query)->fetchAll();
        } catch (Throwable $ex) {
            note_error("Select query error:" . $ex->getMessage());
        }
    }
    function note_user_access()
    {
        $open_log_file = fopen(log_file, "a");
        if($open_log_file)
        {
            fwrite($open_log_file, "{$_SERVER['PHP_SELF']}{$_SERVER['QUERY_STRING']} \t {$_SERVER['REMOTE_ADDR']}" . "\t\t" . date("d.m.Y \t H:i:s", time()) . "\r\n");
            fclose($open_log_file);
        }
    }
    function note_error($message)
    {
        $open_err_file = fopen(err_file, "a");
        if($open_err_file)
        {
            fwrite($open_err_file, "{$_SERVER['PHP_SELF']}{$_SERVER['QUERY_STRING']} \t {$_SERVER['REMOTE_ADDR']}" . "\t\t" . $message . "\t\t" . date("d.m.Y \t H:i:s", time()) . "\r\n");
            fclose($open_err_file);
        }
    }
?>