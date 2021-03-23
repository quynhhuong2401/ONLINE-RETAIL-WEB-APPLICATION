<?php
    $a = (isset($_GET['a'])) ? $_GET['a'] : 1; 
    
    switch ($a) {
        case 0:
            include ("pages/pError.php");
            break;
        case 1:
            include ("pages/pHome.php");
            break;
        case 2: 
            include ("pages/pProductsByBrand.php");
            break;
        case 3: 
            include ("pages/pProductsByCategory.php");
            break;
        case 4:
            include ("pages/pDetailsOfTheProduct.php");
            break;
        case 6:
            include ("pages/pCartManagement.php");
            break;
        case 8:
            include ("pages/pRegistration.php");
            break;
        case 10:
            include ("pages/exLogin.php");
            break;
        case 11:
            include ("pages/exLogOut.php");
            break;
        case 12:
            include ("pages/exAddProductsToCart.php");
            break;
        case 13:
            include ("pages/exUpdateCart.php");
            break;
        case 15:
            include ("pages/exRegistration.php");
            break;
        case 16:
            include ("pages/pSearch.php");
            break;
        case 17:
            include ("pages/CartManagement/exOrder.php");
            break;
        case 18:
            include ("pages/pOrderSuccess.php");
            break;
        case 19:
            include ("pages/pQueryBox.php");
            break;
    }
?>