<?php
    if(isset($_POST["txtSL"]) && isset($_POST["hiddenPid"]))
    {
        $sl = $_POST["txtSL"];
        $id = $_POST["hiddenPid"];
        $sql = "SELECT storage_amount
        FROM product
        WHERE  pid = $id";
        $list = DataProvider::ExecuteQuery($sql);
        $row = mysqli_fetch_array($list);
        $soLuongTon = $row["storage_amount"];
        if(is_numeric($sl)) {
            $shoppingCart = unserialize($_SESSION["shoppingcart"]);               
            if ($sl == 0 || $sl > $soLuongTon)
            $shoppingCart->delete($id);
            else
                if($sl > 0)
                $shoppingCart->update($id, $sl);
            $_SESSION["shoppingcart"] = serialize( $shoppingCart);
        }
    }
    DataProvider::ChangeURL('index.php?a=6');
?>