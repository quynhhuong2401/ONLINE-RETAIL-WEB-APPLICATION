<?php
    if(isset($_SESSION["totalcost"])){
        $total_cost = $_SESSION["totalcost"];
        if ($total_cost == 0){
            DataProvider::ChangeURL("index.php?a=6");
        }

    }
?>
<h2>You ordered succeed</h2>
<img src="images/camon.jpg" alt="" width="700" height="500">
<?php
if(isset($_SESSION["shoppingcart"]))
{
    $bill_COD_id = mt_rand(1,100000);
    $bill_detail_id = mt_rand(100001,2147483647);
    if(isset($_SESSION["account_id"]))
    {
        $account_id = $_SESSION["account_id"];
    }
    $sql = "insert into billcod (bill_COD_id,order_date,total_cost,account_id,process_id)
        values('$bill_COD_id',now(), $total_cost,$account_id,1)";
        DataProvider::ExecuteQuery($sql);
        $shoppingCart = unserialize($_SESSION["shoppingcart"]);
            $i = 1;
            $totalAmount = 0;
            foreach($shoppingCart->listProduct as $p)
            {
                $sql = "SELECT pname, picURL, price FROM product WHERE pid = $p->id";
                $result = DataProvider::ExecuteQuery($sql);
                $row = mysqli_fetch_array($result);
                $pid = $p->id;
                $price = $row['price'];
                $amount = $p->num;
                $sql = "INSERT into billdetail(bill_detail_id,amount,cost,bill_COD_id,pid)
                values (' $bill_detail_id','$amount','$price',' $bill_COD_id',' $pid')";
                DataProvider::ExecuteQuery($sql);
                $sql = "UPDATE product SET storage_amount = (storage_amount - $amount) and sold_out_amount = (sold_out_amount + $amount)
                WHERE pid = $pid";
                DataProvider::ExecuteQuery($sql);
            }
        
        unset($_SESSION["totalcost"]);
        unset($_SESSION["shoppingcart"]);
        DataProvider::ChangeURL("index.php?a=18");
}
    
?>