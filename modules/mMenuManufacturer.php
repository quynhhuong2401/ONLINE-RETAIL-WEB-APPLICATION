<dl>
<dt>Manufacturer</dt>
<?php
    $sql = "SELECT hsx.mid, hsx.mname
            FROM manufacturer hsx
            WHERE hsx.mdeleted = 0";
    $list = DataProvider::ExecuteQuery($sql);
    while($row = mysqli_fetch_array($list)){
        $name = $row["mname"];
        $url = "index.php?a=2&id=".$row["mid"];
        include "templates/tempMenu.php";
    }
?>
</dl>