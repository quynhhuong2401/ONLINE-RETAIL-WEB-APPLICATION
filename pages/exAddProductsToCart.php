<?php
    if(isset($_GET['id']))
    {
        $pid = $_GET['id'];
        $sql = "SELECT storage_amount
        FROM product
        WHERE  pid = $pid";
        $list = DataProvider::ExecuteQuery($sql);
        $row = mysqli_fetch_array($list);
        $storage_amount = $row["storage_amount"];
        $shoppingCart = new ShoppingCart();
        if(isset($_SESSION['shoppingcart']))
        $shoppingCart = unserialize($_SESSION['shoppingcart']);
        if($storage_amount > 0){
            $shoppingCart->Add($pid);
            $_SESSION['shoppingcart'] = serialize($shoppingCart);

            DataProvider::ChangeURL('index.php?a=6');
        }
        else{
            DataProvider::ChangeURL("index.php?a=4&id=$pid");
        }
    }
    else
    {
        DataProvider::ChangeURL('index.php?a=0&id=3');
    }

?>