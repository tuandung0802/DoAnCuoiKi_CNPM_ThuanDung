<?php
	include 'inc/header.php';
	include 'inc/slider.php';

?>

 <div class="main">
    <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>Sản phẩm đến từ Apple</h3>
    		</div>
    		<div class="clear"></div>
    	</div>
		<div class="section group">
		<?php 
				$getpdApple = $product->getpdApple();
				if($getpdApple){
					while($resultapple = $getpdApple->fetch_assoc()){
				?>
				<div class="grid_1_of_4 images_1_of_4">
					 <a href="preview-3.php"><img src="admin/uploads/<?php echo $resultapple['image']?>" alt="" /></a>
					 <h2><?php echo $resultapple['productName'] ?> </h2>
					 <p><?php echo $fm->textShorten($resultapple['product_desc'],50) ?></p>
					 <p><span class="price"><?php echo $fm->format_currency($resultapple['price']).' '.'VND'; ?></span></p>
				     <div class="button"><span><a href="details.php?proid=<?php echo $resultapple['productId']?>" class="details">Đặt hàng</a></span></div>
				</div>
				<?php
					}}
				?>
			</div>
			<div class="content_bottom">
    		<div class="heading">
    		<h3>Sản phẩm đến từ SAMSUNG</h3>
    		</div>
    		<div class="clear"></div>
    	</div>
			<div class="section group">
			<?php 
				$getpdSamsung = $product->getpdSamsung();
				if($getpdSamsung){
					while($resultsamsung = $getpdSamsung->fetch_assoc()){
				?>
				<div class="grid_1_of_4 images_1_of_4">
					 <a href="preview-3.php"><img src="admin/uploads/<?php echo $resultsamsung['image']?>" alt="" /></a>
					 <h2><?php echo $resultsamsung['productName'] ?> </h2>
					 <p><?php echo $fm->textShorten($resultsamsung['product_desc'],50) ?></p>
					 <p><span class="price"><?php echo $fm->format_currency($resultsamsung['price']).' '.'VND'; ?></span></p>
				     <div class="button"><span><a href="details.php?proid=<?php echo $resultsamsung['productId']?>" class="details">Đặt hàng</a></span></div>
				</div>
				<?php
					}}
				?>
				
			</div>
    </div>
 </div>
 <?php
	include 'inc/footer.php';
	

?>