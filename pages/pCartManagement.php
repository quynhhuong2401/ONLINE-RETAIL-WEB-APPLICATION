<div id="cartmanagement">
<h1>Cart Management</h1>
<table>
    <tr>
        <th width="20">STT</th>
        <th>PRODUCT NAME</th>
        <th width="60">PIC</th>
        <th width="50">PRICE</th>
        <th width="50">AMOUNT</th>
        <th width="50">OPERATION</th>
    </tr>
    <?php
       $total_cost = 0;
        if(isset($_SESSION["shoppingcart"]))
        {
            $shoppingCart = unserialize($_SESSION["shoppingcart"]);
            $i = 1;

            foreach($shoppingCart->listProduct as $p)
            {
                $sql = "SELECT pname, picURL, price FROM product WHERE pid = $p->id";
                $result = DataProvider::ExecuteQuery($sql);
                $row = mysqli_fetch_array($result);

                $pname= $row['pname'];
                $pid = $p->id;
                $picURL = $row['picURL'];
                $price = $row['price'];

                include("templates/tempShoppingCart.php");
                $total_cost += $p->num * $price;
            }
        }
    ?>

</table>
<div class="pprice">
    Total Cost: <?php echo  $total_cost; ?> vnđ
    <?php
        $_SESSION["totalcost"] =  $total_cost;
    ?>
</div>
<a href="index.php?a=17">
    <img src="img/Order.png" width="100">
</a>
</div>