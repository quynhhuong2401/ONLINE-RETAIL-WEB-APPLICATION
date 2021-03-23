<style> /*css inline*/
.error{
    color: red;
    display: none;
    font-size: 11px;
}
</style>
<form action="index.php?a=15" method="POST" onSubmit="return KTDangNhap()">
    <div>
        <h1 align="center">CREATE YOUR ACCOUNT</h1>
        <fieldset class="fieldset">
        <legend><strong>Account Information</strong></legend>
        <table align="center" border="0" width="350" height="150">              
        <tr>
            <td width="300"><strong> ID :</strong><span>*</span></td>
            <td><input type="text" name="txtUsername" id="txtUsername"></td>
        </tr>
         <tr> <!-- Báo lỗi tên đăng ký không được rỗng -->
            <td></td>
            <td><strong><span class="error" id="errorusername"></span></strong></td>
        </tr>
        <tr>
            <td><strong>Password:</strong><span>*</span></td>
            <td><input type="password" name="txtPassword" id="txtPassword"></td>
        </tr>
        <tr> <!-- Báo lỗi Mật khẩu không được rỗng -->
            <td></td>
            <td><strong><span class="error" id="errorPassword"></strong></span></td>
        </tr>
        <tr>
            <td><strong>Repeat password :</strong><span>*</span></td>
            <td><input type="password" name="txtRepeatpassword" id="txtRepeatpassword"></td>
        </tr>
        <tr> <!-- Báo lỗi Mật khẩu xác nhận không chính xác-->
            <td></td>
            <td><strong><span class="error" id="errorRepeatpassword"></strong></span></td>
        </tr>
        <tr>
            <td width="300"><strong> Card ID :</strong><span>*</span></td>
            <td><input type="text" name="txtCardID" id="txtCardID"></td>
        </tr>
         <tr> <!-- Báo lỗi card ID không được rỗng -->
            <td></td>
            <td><strong><span class="error" id="errorCardID"></span></strong></td>
        </tr>
        <tr>
            <td width="300"><strong> Card User Name :</strong><span>*</span></td>
            <td><input type="text" name="txtcard_username" id="txtcard_username"></td>
        </tr>
         <tr> <!-- Báo lỗi card user name không được rỗng -->
            <td></td>
            <td><strong><span class="error" id="errorcard_username"></span></strong></td>
        </tr>
        <tr>
            <td width="300"><strong> Card Type :</strong><span>*</span></td>
            <td>
            <select name="card_type">
                <option value="Master Card" selected>Master Card</option>
                <option value="Visa Card">Visa Card</option>
            </select>
            </td>
        </tr>
         <tr> <!-- Báo lỗi card user name không được rỗng -->
            <td></td>
            <td><strong><span class="error" id="errorcard_type"></span></strong></td>
        </tr>                                             
        </table>
        </fieldset>
        <hr width="53%">
        <fieldset class="fieldset">
        <legend><strong>Contact info</strong></legend>
        <table align="center" border="0" width="340" height="200">
            <tr>
                <td width="300"><strong>Full name :</strong><span>*</span></td>
                <td><input type="text" name="txtFullname" id="txtFullname"></td>
            </tr>
            <tr> <!-- Báo lỗi Tên Hiển Thị không được rỗng -->
                <td></td>
                <td><strong><span class="error" id="errorFullname"></strong></span></td>
            </tr>
            <tr>
                <td><strong>Address:</strong><span>*</span></td>
                <td><input type="text" name="txtAddress" id="txtAddress"></td>
            </tr>
            <tr> <!-- Báo lỗi Địa chỉ không được rỗng -->
                <td></td>
                <td><strong><span class="error" id="errorAddress"></strong></span></td>
            </tr>
            <tr>
                <td><strong>Phone number:<span>*</span></strong></td>
                <td><input type="text" name="txtPhonenumber" id="txtPhonenumber"></td>
            </tr>
            <tr> <!-- Báo lỗi Điện Thoại không được rỗng -->
                <td></td>
                <td><strong><span class="error" id="errorPhonenumber"></strong></span></td>
            </tr>
            <tr>
                <td><strong>Email:</strong></td>
                <td><input type="text" name="txtEmail" id="txtEmail"></td>
            </tr>
            </table>
            </fieldset>
            <br>
            <div align="center">
                <button type="submit" name="btnDK" > <strong>Sign up</strong></button>
            </div>          
        </div>
</form>

<script type="text/javascript">
    function KTDangNhap(){
        if(document.getElementById("txtusername").value == "")
        {
            document.getElementById("txtusername").focus();
            // alert("User name is not null");
            $('#errorUsername').css({'display':'inline'});
            $('#errorUsername').html('User name is not null');
            return false;
        }
        else
        {
            document.getElementById("txtusername").focus();
            $('#errorUsername').css({'display':'none'});
            $('#errorUsername').html('User name is not null');

        }

        if(document.getElementById("txtpassword").value == "")
        {
            document.getElementById("txtpassword").focus();
            // alert("Pasword is not null");
            $('#errorPassword').css({'display':'inline'});
            $('#errorPassword').html('Pasword is not null');

            return false;
        }
        else
        {
            document.getElementById("txtpassword").focus();
            $('#errorPassword').css({'display':'none'});
            $('#errorPassword').html('Pasword is not null');
        }

        if(document.getElementById("txtpassword").value != document.getElementById("txtRepeatpassword").value)
        {
            document.getElementById("txtpassword").focus();
            // alert("Mật khẩu không khớp");
            $('#errorPasswordAgain').css({'display':'inline'});
            $('#errorPasswordAgain').html('Mật khẩu xác nhận không khớp');

            return false;
        }
        else
        {
            document.getElementById("txtpassword").focus();
            $('#txtRepeatpassword').css({'display':'none'});
            $('#txtRepeatpassword').html('Mật khẩu xác nhận không khớp');
        }

        if(document.getElementById("txtFullname").value == "")
        {
            document.getElementById("txtFullname").focus();
            // alert("Tên Hiển Thị không được rỗng");
            $('#errorFullname').css({'display':'inline'});
            $('#errorFullname').html('Tên Hiển Thị không được rỗng');

            return false;
        }
        else
        {
            document.getElementById("txtFullname").focus();
            $('#errorFullname').css({'display':'none'});
            $('#errorFullname').html('Tên Hiển Thị không được rỗng');
        }

        if(document.getElementById("txtAddress").value == "")
        {
            document.getElementById("txtAddress").focus();
            // alert("Địa chỉ không được rỗng");
            $('#errorAddress').css({'display':'inline'});
            $('#errorAddress').html('Địa chỉ không được rỗng');

            return false;
        }
        else
        {
            document.getElementById("txtAddress").focus();
            $('#errorAddress').css({'display':'none'});
            $('#errorAddress').html('Địa chỉ không được rỗng');
        }

        if(document.getElementById("txtPhonenumber").value == ""){
            document.getElementById("txtPhonenumber").focus();
            // alert("Điện Thoại không được rỗng");
            $('#errorPhonenumber').css({'display':'inline'});
            $('#errorPhonenumber').html('Điện Thoại không được rỗng');

            return false;
        }
        else
        {
            document.getElementById("txtPhonenumber").focus();
            $('#errorPhonenumber').css({'display':'none'});
            $('#errorPhonenumber').html('Điện Thoại không được rỗng');
        }
        return true;
    }
</script>