<div id="productDetails">
<div id="detailLeft">
    <img src="images/<?php echo $picURL; ?>">
</div>
<div id="detailRight">
    <div>
        <span class="label">Name:</span>
        <span class="productname"><?php echo $pname; ?></span>
    </div>
    <div>
        <span class="label">Price:</span>
        <span class="price"><?php echo $price?> đ</span>
    </div>
    <div>
        <span class="label">Manufacturer:</span>
        <span class="factory"><?php echo $mname; ?></span>
    </div>
    <div>
        <span class="label">Category:</span>
        <span class="data"><?php echo $cname; ?></span>
    </div>
    <div>
        <span class="label">Amount:</span>
        <span class="data"><?php echo $storage_amount; ?> Product</span>
    </div>
    <div class="shoppingCart">
        <?php 
            if(isset($_SESSION["account_id"]))
            {
                ?>
                    <a href="index.php?a=12&id=<?php echo $pid; ?>">
                        <img src="img/shopping_cart.png" width="32">
                    </a>
                <?php
            }
        ?>
    </div>
</div>
<div id="description"><?php echo  $description ; ?></div>
</div>



<h2>5 General products </h2>
<?php
            $sql = "SELECT sp.pid, sp.pname, sp.price, sp.picURL
                    FROM product sp
                    WHERE sp.pdeleted = 0 AND sp.cid =  $cid and sp.pid != $pid
                    LIMIT 0,5";
            $list = DataProvider::ExecuteQuery($sql);
            while($row = mysqli_fetch_array($list)){
            $pid= $row["pid"];
            $pname= $row["pname"];
            $price= $row["price"];
            $picURL = $row["picURL"];
            include ("templates/tempThumbProduct.php");
            }

?>
