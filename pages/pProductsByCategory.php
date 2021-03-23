<h2>Category > Product </h2>
<?php
    if(isset($_GET["id"])){
        $sql = "SELECT sp.pid, sp.pname, sp.price, sp.picURL
                FROM product sp
                WHERE sp.pdeleted = 0 AND sp.cid = ".$_GET["id"];
        $list = DataProvider::ExecuteQuery($sql);
        while($row = mysqli_fetch_array($list)){
        $pid = $row["pid"];
        $pname = $row["pname"];
        $price = $row["price"];
        $picURL = $row["picURL"];
        include ("templates/tempThumbProduct.php");
        }
    }
    else{
        DataProvider::ChangeURL("index.php?a=0&id=1");
    }
?>