<?php
	include 'inc/header.php';

?>
<?php

// if(isset($_GET['orderid']) AND $_GET['orderid']=='order'){
//     $customer_id = Session::get('customer_id');
//     $insertOrder = $ct->insertOrder($customer_id);
//     $delCart = $ct->del_all_data_cart();
//     header('Location:success.php');
// }
$login_check = Session::get('customer_login');
if($login_check==false){
    header('Location:login.php');
	
}
 $ct = new cart();
if(isset($_GET['confirmid'])){
	$id = $_GET['confirmid'];
	$time = $_GET['time'];
	$price = $_GET['price'];
	$confirm_shifted = $ct->confirm_shifted($id,$time,$price);
  }


?>
<style type="text/css">
    .box_left{
            width: 100%;
            border: 1px solid #666;
            
            padding: 4px;
    }
    .cartpage h2 {
    border-bottom: 1px solid #ddd;
    font-size: 30px;
    margin-bottom: 20px;
    width: 100%;
}
    
</style>
<form action="" method="post" enctype="multipart/form">
 <div class="main">
    <div class="content">
    	<div class="section group">
        <div class="heading">
    		<h3>Thanh toán trực tiếp</h3>
    		</div>
            
    		<div class="clear"></div>
            <div class="box_left">
            <div class="cartpage">
			    	<h2>Đơn hàng bạn đã đặt</h2>
					
						<table class="tblone">
							<tr>
								<th width="5%">ID</th>
								<th width="20%">Tên sản phẩm</th>
								<th width="15%">Giá (VNĐ)</th>
								<th width="5%">Số lượng</th>
								<th width="20%">Tổng tiền (VNĐ)</th>
								<th width="10%">Ngày đặt</th>
								<th width="15%">Tình trạng</th>
								<th width="25%">Xác nhận</th>


							</tr>

							<?php
             $customer_id = Session::get('customer_id');

							$get_cart_ordered = $ct->get_cart_ordered($customer_id);
							if($get_cart_ordered){
								
								$qty =0;
                                $i=0;
									while($result = $get_cart_ordered->fetch_assoc()){
                                            $i++;
									
							
							?>
							<tr>
								<td><?php echo $i  ?></td>
								<td><?php echo $result['productName']  ?></td>
								<td><?php echo $fm->format_currency($result['price'])." "."VND"?></td>
								<td>
                                <?php echo $result['quantity'] ?>
								</td>
								<td><?php $total = $result['price'] * $result['quantity'];
								echo $fm->format_currency($total)." "."VND"?></td>
                                <td><?php echo $fm->formatDate($result['date_order']) ?></td>
                                <td>
                                    <?php if($result['status']=='0'){
                                        echo 'Đang xử lý';
                                    }elseif($result['status']=='1'){
                                        ?>
										<span>Đang vận chuyển</span>
									<?php
                                    }else{
										echo 'Đã nhận hàng';
									}
									?>
                                </td>
							<?php
									if($result['status'] ==0){
										?>
										<td><?php echo 'Chờ';?></td>
										<?php
									}elseif($result['status'] ==1){
										?>
									<td>
										<a href="?confirmid=<?php echo $customer_id ?>&price=<?php echo $result['price'] ?>&time=<?php echo $result['date_order'] ?>">Nhận hàng </a>

									</td>
										
									<?php
									}elseif($result['status'] ==2){
									?>
									<td>OK</td>
									<?php
									}
									?>
							</tr>
							<?php
								}
						}
							?>
							
							
							
							
						</table>
						
						
					</div>
            </div>
            
            
        
    </div>
 	</div>
     </form>
<?php
	include 'inc/footer.php';
?>