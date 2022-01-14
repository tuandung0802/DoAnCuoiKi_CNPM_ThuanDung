<?php
	include 'inc/header.php';
	// include 'inc/slider.php';

?>
<?php
	if(isset($_GET['cartid'])) {
		$cartid = $_GET['cartid'];
		$delcart = $ct->del_product_cart($cartid);
	}


if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])){
	$cartId = $_POST['cartId'];
		
	$quantity = $_POST['quantity'];
	$update_quatity_Cart = $ct->update_quantity_cart($quantity,$cartId);
	
}
?>
<?php
		if(!isset($_GET['id'])){
			echo "<meta http-equiv='refresh' content='0;URL=?id=live'>";
		}
?>
 <div class="main">
    <div class="content">
    	<div class="cartoption">		
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
								<th width="20%">Tên sản phẩm</th>
								<th width="10%">Ảnh sản phẩm</th>
								<th width="15%">Giá</th>
								<th width="25%">Số lượng</th>
								<th width="20%">Tống tiền</th>
								<th width="10%">Trạng thái</th>
							</tr>

							<?php
							$get_product_cart = $ct->get_product_cart();
							if($get_product_cart){
								$subtotal = 0;
								$qty =0;
									while($result = $get_product_cart->fetch_assoc()){

									
							
							?>
							<tr>
								<td><?php echo $result['productName']  ?></td>
								<td><img src="admin/uploads/<?php echo $result['image'] ?>" alt=""/></td>
								<td><?php echo $fm->format_currency($result['price'])." "."VND" ?></td>
								<td>
									<form action="" method="post">
										<input type="hidden" name="cartId"  value="<?php echo $result['cartId'] ?>"/>
										<input type="number" name="quantity" min="1" value="<?php echo $result['quantity'] ?>"/>
										<input type="submit" name="submit" value="Update"/>
									</form>
								</td>
								<td><?php $total = $result['price'] * $result['quantity'];
								echo $fm->format_currency($total)." "."VND"?>
							</td>
								<td><a href="?cartid=<?php echo $result['cartId'] ?>">Xóa</a></td>
							</tr>
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
								<td>10%</td>
							</tr>
							<tr>
								<th>Tổng :</th>
								<td><?php $vat = $subtotal * 0.1;
								$gtotal = $vat + $subtotal;
								echo $fm->format_currency($gtotal)." "."VND" ?> </td>
							</tr>
							<?php
									}else{
										echo 'Giỏ hàng trống';
									}
							?>
					   </table>
					</div>
					<div class="shopping">
						<div class="shopleft">
							<a href="index.php"> <img src="images/shop.png" alt="" /></a>
						</div>
						<div class="shopright">
							<a href="payment.php"> <img src="images/check.png" alt="" /></a>
						</div>
					</div>
    	</div>  	
       <div class="clear"></div>
    </div>
 </div>
 <?php
	include 'inc/footer.php';
	

?>