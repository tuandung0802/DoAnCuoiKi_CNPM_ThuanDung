
<?php
	include 'inc/header.php';
	// include 'inc/slider.php';
	

?>
<?php
			$login_check = Session::get('customer_login');
			if($login_check){
				header('Location:order.php');
			}
			?>

<?php
if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['login'])){
		

	$login_Customers = $cs->login_customers($_POST);
	
}
?>
 <div class="main">
    <div class="content">
    	 <div class="login_panel">
        	<h3>Khách hàng đại lý</h3>
        	<p>Đăng nhập đại lý</p>
			<?php
			 if(isset($login_Customers)){
				 echo $login_Customers;
			 }
			?>
        	<form action="" method="POST" >
                	<input  type="text" name="email" placeholder="Điền Email">
                    <input  type="password" name="password" placeholder="Điền password" >
					<p class="note">Nếu quên mật khẩu <a href="#">here</a></p>
                    <div class="buttons"><div><input type="submit" class="grey" name="login" value="Đăng nhập"></input></div></div>
				</form>
				</div>
    	
       <div class="clear"></div>
    </div>
 </div>
 <?php
	include 'inc/footer.php';
	

?>