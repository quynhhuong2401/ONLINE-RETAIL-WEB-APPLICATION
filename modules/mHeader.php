<div class="header">
    <a href="index.php">
            <img src="img/logo.png" alt="image not found" class="logo">
    </a>
    <table width="370" height="20" class="formSearch">
    <tr>
        <td>
            <form action="index.php?a=16" method="POST" class="TimKiem" >
                Search:<input type="text" name="txtSearch" id="txtSearch">
                <button type="submit" name="btnSearch">Search</button>
            </form>
        </td>
       
        <td>
            <form action="index.php?a=19" method="POST" class="Query" >
                <button type="submit" name="btnQuery">Query box</button>
            </form>
        </td>
    </tr>
    
    </table>
    <?php
        if(isset($_SESSION['account_id']))
        {
            include ("modules/mAccountInfor.php");
        }
        else
        {
            include ("modules/mAccountLogin.php");
        }
    ?>
</div>
<div class="sliderboxHead">
    <div id="sliderbox" >
        <img src="img/slider1.jpg" alt="image not found">
        <img src="img/slider2.jpg" alt="image not found">
        <img src="img/slider3.jpg" alt="image not found">
        <img src="img/slider4.jpg" alt="image not found">
    </div>
</div>