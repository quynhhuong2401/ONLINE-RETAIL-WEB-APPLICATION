<div id="accountId">
    <?php
        echo "Hello, ".$_SESSION["fullname"]." | ";
    ?>
    <a href="index.php?a=11">
        <button>Logout</button>
    </a> |
    <a href="index.php?a=6">
        <img src="img/manage_shopping.png" height="25"/>
        Shopping Cart
    </a>
</div>