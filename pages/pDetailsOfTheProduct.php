<?php
    if(isset($_GET['id'])){
        $pid = $_GET['id'];
        $sql = "SELECT sp.pid, sp.pname, sp.price, sp.picURL, sp.storage_amount, sp.description, lsp.cname, hsx.mname,lsp.cid
                FROM product sp, category lsp, manufacturer hsx
                WHERE sp.pdeleted = 0 AND sp.pid = $pid AND sp.cid = lsp.cid AND sp.mid = hsx.mid";
        $list = DataProvider::ExecuteQuery($sql);
        while($row = mysqli_fetch_array($list)){
            $picURL = $row["picURL"];
            $cid= $row["cid"];
            $pname= $row["pname"];
            $price = $row["price"];
            $mname = $row["mname"];
            $cname = $row["cname"];
            $storage_amount= $row["storage_amount"];
            $description = $row["description"];
            include ("templates/tempDetailsOfTheProduct.php");
        }
    }
    else
    {
        DataProvider::ChangeURL("index.php");
    }
?>
