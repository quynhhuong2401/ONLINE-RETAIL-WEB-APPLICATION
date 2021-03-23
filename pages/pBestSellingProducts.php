<h2>Best seller product</h2>
<?php
    $sql = "SELECT sp.pid, sp.pname, sp.price, sp.picURL
            FROM product sp
            WHERE sp.pdeleted = 0
            ORDER BY sp.sold_out_amount DESC
            LIMIT 0, 10";
        $list = DataProvider::ExecuteQuery($sql);
        while($row = mysqli_fetch_array($list)){
            $pid = $row["pid"];
            $pname = $row["pname"];
            $price = $row["price"];
            $picURL = $row["picURL"];
            include ("templates/tempThumbProduct.php");
        }
?>