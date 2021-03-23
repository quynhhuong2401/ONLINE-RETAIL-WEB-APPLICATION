<form name="frmGioHang" action="index.php?a=13" method="post">
<tr>
    <td>
        <?php echo $i++; ?>
    </td>
    <td>
        <?php echo $pname; ?>
    </td>
    <td align="center">
        <img src="images/<?php echo $picURL; ?>" width="50" />
    </td>
    <td>
        <?php echo $price; ?>
    </td>
    <td>
        <input type="text" name="txtSL" value="<?php echo $p->num; ?>" width="45" size="5" />
        <input type="hidden" name="hiddenPid" value="<?php echo $p->id; ?>" />
    </td>
    <td>
        <input type="submit" value="Update Amount" />
    </td>
</tr>
</form>