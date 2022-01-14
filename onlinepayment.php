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
    .box_left{
            width: 50%;
            border: 1px solid #666;
            float: left;
            padding: 4px;
    }
    .box_right{
            width: 47%;
            border: 1px solid #666;
            float: right;
            padding: 10px;


    }
    .submit_order {
        padding: 10px 70px ;
        border: none;
        background: orange;
        font-size: 25px;color: #fff;
        margin: 20px;
        cursor: pointer;
    }
    .payment{
        display: flex;
        flex-direction: row;
        justify-content: center;
        align-items: center;
        color: orange;
    }
</style>
<form action="" method="post" enctype="multipart/form">
 <div class="main">
    <div class="content">
    	<div class="section group">
        <div class="heading">
    		<h3>Thanh toán Online</h3>
    		</div>
            
    		<div class="clear"></div>
            <div class="box_left">
            <div class="cartpage">
			    	<h2>Giỏ hàng</h2>
					<?php
						if(isset($update_quatity_Cart)){
							echo $update_quatity_Cart;
						}
					?>
					<?php
						if(isset($delcart)){
							echo $delcart;
						}
					?>
						<table class="tblone">
							<tr>
								<th width="5%">ID</th>
								<th width="30%">Tên sản phẩm</th>
								<th width="15%">Giá (VNĐ)</th>
								<th width="25%">Số lượng</th>
								<th width="20%">Tổng tiền (VNĐ)</th>
							</tr>

							<?php
							$get_product_cart = $ct->get_product_cart();
							if($get_product_cart){
								$subtotal = 0;
								$qty =0;
                                $i=0;
									while($result = $get_product_cart->fetch_assoc()){
                                            $i++;
									
							
							?>
							<tr>
								<td><?php echo $i  ?></td>
								<td><?php echo $result['productName']  ?></td>
								<td><?php echo $fm->format_currency($result['price'])." "."VND"  ?></td>
								<td>
                                <?php echo $result['quantity'] ?>
								</td>
								<td><?php $total = $result['price'] * $result['quantity'];
								echo $fm->format_currency($total)." "."VND" ?>
							
							<?php
									$subtotal += $total;
								$qty = $qty + $result['quantity'];

								}
						}
							?>
							
							
							
							
						</table>
						<?php
									$check_cart = $ct->check_cart();
									if($check_cart){
									
									
									?>
						<table style="float:right;text-align:left;" width="40%">
							<tr>
								<th>Giá sản phẩm : </th>
								<td><?php
									echo $fm->format_currency($subtotal)." "."VND";
									Session::set('sum',$subtotal);
									Session::set('qty',$qty);

									?>								
								</td>
							</tr>
							<tr>
								<th>VAT : </th>
								<td>10% (<?php echo $fm->format_currency($vat = $subtotal*0.1); ?>)</td>
							</tr>
							<tr>
								<th>Tổng :</th>
								<td><?php $vat = $subtotal * 0.1;
								$gtotal = $vat + $subtotal;
								echo $fm->format_currency($gtotal)." "."VND"?> </td>
							</tr>
							<?php
									}else{
										echo 'Giỏ hàng trống';
									}
							?>
					   </table>
					</div>
            </div>
            <div class="box_right">
            <table class=tblone>
                <?php
                $id= Session::get('customer_id');
                   $get_customer=$cs->show_customers($id);
                   if($get_customer){
                       while($result = $get_customer->fetch_assoc()){

                       ?>
                <tr>
                    <td>Tên</td>
                    <td>:</td>
                    <td><?php echo $result['name']?></td>
                </tr>
                <tr>
                    <td>Thành phố</td>
                    <td>:</td>
                    <td><?php echo $result['city']?></td>
                </tr><tr>
                    <td>Số điện thoại</td>
                    <td>:</td>
                    <td><?php echo $result['phone']?></td>
                </tr><tr>
                    <td>Zipcode</td>
                    <td>:</td>
                    <td><?php echo $result['zipcode']?></td>
                </tr><tr>
                    <td>Email</td>
                    <td>:</td>
                    <td><?php echo $result['email']?></td>
                </tr><tr>
                    <td>Địa chỉ</td>
                    <td>:</td>
                    <td><?php echo $result['address']?></td>
                </tr>
                <tr>
                    <td colspan="3"><a href="editprofile.php">Cập nhật thông tin</a></td>
                    
                </tr>
                <?php
            }
        } 
     ?>
            </table>
            </div>
            <div class="box_right">
            <table class=tblone>
                
                <tr >
                    <div class="payment">
                    <img class="img_momo" src="./images/momo.png" alt="" width="50px">
                    <div>MOMO: 0342548657 (Nguyen Tuan Dung) </div>        <br/>
                    
                    </div>
                
                </tr>
                <tr >
                    <div class="payment">
                    <img class="img_zalo" src="./images/zalopay.png" alt="" width="40px">
                    <div>ZaloPay: 0342548657 (Nguyen Tuan Dung) </div>        <br/>
                    
                    </div>
                
                </tr><tr >
                    <div class="payment">
                    <img class="img_vietcombank" src="./images/vietcombank.png" alt="" width="50px">
                    <div>STK: 0051000553671 (Nguyen Tuan Dung) </div>        <br/>
                    
                    </div>
                
                </tr>
                <tr>
                    *Vui lòng ghi chú tên đại lý và nhấn đặt hàng. Trong vòng 5 phút sẽ có nhân viên gọi điện cho quý khách để xác nhận!*

                </tr>
                
                
            </table>
            </div>
        </div>
        
    </div>
    <center><a href="?orderid=order" class=submit_order>Đặt hàng</a></center> <br>                    
 	</div>
     </form>
<?php
	include 'inc/footer.php';
?>