<?php
    
    include_once "lib/config.php";
    global $db_host, $db_username, $db_password, $db_name;

    $connection = new mysqli($db_host, $db_username, $db_password, $db_name);
    /* check connection */
    if ($connection->connect_error) {      
        die("Failed to connect: " . $connection->connect_error);
      }
           
    if(isset($_POST["txtUsername"]) && isset($_POST["txtPassword"]) && isset($_POST["txtFullname"]) 
        && isset($_POST["txtAddress"]) && isset($_POST["txtPhonenumber"]) && isset($_POST["txtEmail"]) 
        && isset($_POST["txtCardID"]) && isset($_POST["txtcard_username"]) && isset($_POST["card_type"]) ){
            $userName = $_POST["txtUsername"];
            $passWord = $_POST["txtPassword"];
            $fullName = $_POST["txtFullname"];
            $address = $_POST["txtAddress"];
            $phoneNumber = $_POST["txtPhonenumber"];
            $email = $_POST["txtEmail"];
            $card_id = $_POST["txtCardID"];
            $card_username = $_POST["txtcard_username"];
            $card_type = $_POST["card_type"];

            $sql = "insert into account (username,pass,fullname,address,phone_number,mail,adeleted,account_type_id) 
            values ('$userName','$passWord','$fullName','$address','$phoneNumber','$email',0,1)";
            if($connection->query($sql) == true)
            {
                $latest_id = $connection->insert_id;
                $sql = "insert into banking (account_id, card_id, card_username, card_type)
                values ('$latest_id','$card_id',' $card_username', '$card_type')";
                DataProvider::ExecuteQuery($sql);
            }
            DataProvider::ChangeURL("index.php");
        }
?>