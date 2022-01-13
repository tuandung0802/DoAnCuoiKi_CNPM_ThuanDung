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
$id= Session::get('customer_id');
if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['save'])){
		
	
	$updateCustomer = $cs->update_customers($_POST, $id);
	
}


?>
 <div class="main">
    <div class="content">
    	<div class="section group">
        <div class="content_top">
    		<div class="heading">
    		<h3>Cập nhật thông tin</h3>
    		</div>
    		<div class="clear"></div>
    	</div>
        <form action="" method="post">
			
            <table class=tblone>
                <tr>
                    

                    <?php
                    if(isset($updateCustomer)){
                        echo '<td colspan="3">'.$updateCustomer.'</td>';
                    }
                    ?>
                    
                </tr>
                <?php
                $id= Session::get('customer_id');
                   $get_customer=$cs->show_customer($id);
                   if($get_customer){
                       while($result = $get_customer->fetch_assoc()){

                       ?>
                <tr>
                    <td>Tên</td>
                    <td>:</td>
                    <td><input type="text" name="name" value="<?php echo $result['name']?>"></td>
                </tr>
                <!-- <tr>
                    <td>Thành phố</td>
                    <td>:</td>
                    <td><input type="text" name="name" value="<?php echo $result['city']?>"></td>
                </tr> -->
                <tr>
                    <td>Số điện thoại</td>
                    <td>:</td>
                    <td><input type="text" name="phone" value="<?php echo $result['phone']?>"></td>
                </tr>
                
                <tr>
                    <td>Zipcode</td>
                    <td>:</td>
                    <td><input type="text" name="zipcode" value="<?php echo $result['zipcode']?>"></td>
                </tr><tr>
                    <td>Email</td>
                    <td>:</td>
                    <td><input type="text" name="email" value="<?php echo $result['email']?>"></td>
                </tr><tr>
                    <td>Địa chỉ</td>
                    <td>:</td>
                    <td><input type="text" name="address" value="<?php echo $result['address']?>"></td>
                </tr>
                <tr>
                    <td colspan="3"><input type="submit" name="save" value="Cập nhật"></input></td>
                    
                </tr>
                <?php
            }
        } 
     ?>
            </table>
            </form>

 				
 		</div>
 	</div>
<?php
	include 'inc/footer.php';
?>