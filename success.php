<?php
	include 'inc/header.php';

?>
<?php
if(isset($_GET['orderid']) AND $_GET['orderid']=='order'){
    $customer_id = Session::get('customer_id');
    $insertOrder = $ct->insertOrder($customer_id);
    $delCart = $ct->del_all_data_cart();
    header('Location:success.php');
}

// if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])){
		
// 	$quantity = $_POST['quantity'];
// 	$addtoCart = $ct->add_to_cart($quantity,$id);
	
// }


?>
<style type="text/css">
    .success{
        text-align: center;
        color:red;
    }
</style>
<form action="" method="post" enctype="multipart/form">
 <div class="main">
    <div class="content">
    	<div class="section group">
            <h2 class="success">Đặt hàng thành công</h2>
            <?php
            $customer_id = Session::get('customer_id');

            $get_amount = $ct->get_AmountPrice($customer_id);
            if ($get_amount){
                $amount = 0;
                while ($result = $get_amount->fetch_assoc()){
                        $price = $result['price'];
                        $amount += $price;
                }
            }
            ?>
        <p>Bạn đã đặt hàng thành công đơn hàng có giá trị: <?php $vat = $amount * 0.1  ; echo $fm->format_currency($total = $vat + $amount); ?> VNĐ</p>
        <p>Chúng tôi sẽ sớm liên lạc với bạn. Xem chi tiết đơn hàng tại  <a href="orderdetails.php">đây</a></p>
            </div>
        </div>
        
    </div>
                     
 	</div>
     </form>
<?php
	include 'inc/footer.php';
?>