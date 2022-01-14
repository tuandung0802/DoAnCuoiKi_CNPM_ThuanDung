<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php include '../classes/customer.php';?>



<?php
$cs = new customer();
	if($_SERVER['REQUEST_METHOD'] == 'POST' && isset($_POST['submit'])){
		

        $insertCustomers = $cs->insert_customers($_POST);
		
	}
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Thêm khách hàng</h2>
                <?php
                if(isset($insertCustomers)){
                    echo $insertCustomers;
                }
                ?>
                <form action="" method="post">
		   			 <table>
		   				<tbody>
						<tr>
						<td>
							<div>
							<input type="text" name="name" placeholder="Tên" >
							</div>
							
							<div>
							   <input type="text" name="city" placeholder="Thành Phố">
							</div>
							
							<div>
								<input type="text" name="zipcode" placeholder="Mã Zip">
							</div>
							<div>
								<input type="text" name="email" placeholder="Email">
							</div>
		    			 </td>
		    			<td>
						<div>
							<input type="text" name="address" placeholder="Địa chỉ">
						</div>
		    		<div>
						<select id="country" name="country" placeholder="Quốc gia">
							<option value="null">Chọn tỉnh thành</option>         
							<option value="HCM">Hồ Chí Minh</option>
							<option value="DN">Đà Nẵng</option>
							<option value="HN">Hà Nội</option>
							<option value="Đà Lạt">Đà Lạt</option>


		         </select>
				 </div>		        
	
		           <div>
		          <input type="text" name="phone" placeholder="Số điện thoại">
		          </div>
				  
				  <div>
					<input type="text" name="password" placeholder="Password">
				</div>
		    	</td>
		    </tr> 
		    </tbody></table> 
		   <div class="search"><div><input type="submit" name="submit" class="grey" value="Tạo Khách Hàng"></input></div></div>
		    <p class="terms">By clicking 'Create Account' you agree to the <a href="#">Terms &amp; Conditions</a>.</p>
		    <div class="clear"></div>
		    </form>
               
            </div>
        </div>
<?php include 'inc/footer.php';?>