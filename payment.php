<?php
	include 'inc/header.php';

?>

<?php
$login_check = Session::get('customer_login');
if($login_check==false){
    header('Location:login.php');
}

?>
<?php
// if(!isset($_GET['proid']) || $_GET['proid']==Null){
//     echo "<script>window.location = '404.php'</script>";
// }else{
//     $id = $_GET['proid'];
// }

// if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])){
		
// 	$quantity = $_POST['quantity'];
// 	$addtoCart = $ct->add_to_cart($quantity,$id);
	
// }


?>
<style>
    h3.payment{
        text-align: center;
        font-size: 20px;
        font-weight: bold;
        text-decoration: underline;

    }
    .wrapper_method{
        text-align: center;
        width: 550px;
        margin: 0 auto;
        border: 1px solid #666;
        padding: 20px;
        background: cornsilk;
    }
    .wrapper_method h3{
        margin-bottom: 20px;

    }
    .wrapper_method a{
        padding: 10px;
        background:red;
        color: #fff;
        
    }
    .wrapper_method .payment_method{
        display: flex;
        justify-content: space-around;
    }
</style>
 <div class="main">
    <div class="content">
    	<div class="section group">
        <div class="content_top">
    		<div class="heading">
    		<h3>Phương thức thanh toán</h3>
    		</div>
            
    		<div class="clear"></div>
            <div class="wrapper_method">
            <h3 class="payment">Chọn phương thức thanh toán</h3>
            <div class="payment_method">

                <p><a href="offlinepayment.php">Thanh toán tiền mặt</a></p>
                <p><a href="onlinepayment.php">Thanh toán online</a></p>
            </div>
            </div>
            
    	</div>
 				
 		</div>
 	</div>
<?php
	include 'inc/footer.php';
?>