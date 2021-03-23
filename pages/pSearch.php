<h2>Searching for product</h2>
<?php
    if(isset($_POST["txtSearch"]) && ($_POST["txtSearch"] != "")){
    $search = $_POST['txtSearch'];

    $sql = "SELECT sp.pid, sp.pname, sp.price, sp.picURL
            FROM product sp 
            WHERE sp.pdeleted = 0 and sp.pname like '%$search%'" ;
    $list = DataProvider::executeQuery($sql);
    while($row = mysqli_fetch_array($list)){
        $pid = $row["pid"];
        $pname = $row["pname"];
        $price= $row["price"];
        $picURL = $row["picURL"];
        include ("templates/tempThumbProduct.php");
        }
    }
    else{
        DataProvider::ChangeURL("index.php");
    }
?>
