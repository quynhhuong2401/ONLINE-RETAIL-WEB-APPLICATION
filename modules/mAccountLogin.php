<table width="580" class="formLogin">
    <tr><td>
    <form name="frmLogin" action="index.php?a=10" method="post" onsubmit="return CheckLogin()">
        User name : <input name="txtUS" type="text" id="txtUS" size="15" maxlength="20" width="15">
        Password : <input name="txtPS" type="password" id="txtPS" size="15" maxlength="20" width="15">
        <input type="submit" value="Login">
        <a href="index.php?a=8"><input type="button" value="Sign up"></a>
    </form>
    </td></tr>
</table>
<script type="text/javascript">
    function CheckLogin()
    {
        var control = document.getElementById("txtUS");
        if(control.value =="")
        {
            control.focus();
            alert("User name is not null");
            return false;
        }

        control = document.getElementById("txtPS");
        if(control.value == "")
        {
            control.focus();
            alert("Password is not null");
            return false;
        }

        return true;
    }

</script>