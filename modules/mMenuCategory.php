<dl>
<dt>Category</dt>
<?php
    $sql = "SELECT lsp.cid, lsp.cname
            FROM category lsp
            WHERE lsp.cdeleted = 0";
    $list = DataProvider::ExecuteQuery($sql);
    while($row = mysqli_fetch_array($list)){
        $name = $row["cname"];
        $url = "index.php?a=3&id=".$row["cid"];
        include "templates/tempMenu.php";
    }
?>
</dl>