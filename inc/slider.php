
	<div class="header_bottom">
		<div class="header_bottom_left">
			<div class="section group">
				<?php 
				$getLastestDell = $product->getLastestDell();
				if($getLastestDell){
					while($resultdell = $getLastestDell->fetch_assoc()){
				?>
				<div class="listview_1_of_2 images_1_of_2">
					<div class="listimg listimg_2_of_1">
						 <a href="preview.php"> <img src="admin/uploads/<?php echo $resultdell['image']?>" alt="" /></a>
					</div>
				    <div class="text list_2_of_1">
						<h2>Dell</h2>
						<p><?php  echo  $fm->textShorten($resultdell['productName'], 50)?></p>
						<div class="button"><span><a href="details.php?proid=<?php echo $resultdell['productId']?>">Đặt hàng</a></span></div>
				   </div>
			   </div>
			   <?php
			   }
			}
			   ?>
			   <?php 
				$getLastestSamsung = $product->getLastestSamsung();
				if($getLastestSamsung){
					while($resultsamsung = $getLastestSamsung->fetch_assoc()){
				?>			
				<div class="listview_1_of_2 images_1_of_2">
					<div class="listimg listimg_2_of_1">
						  <a href="preview.php"><img src="admin/uploads/<?php echo $resultsamsung['image']?>" alt="" / ></a>
					</div>
					<div class="text list_2_of_1">
						  <h2>Samsung</h2>
						  <p><?php  echo  $fm->textShorten($resultsamsung['productName'], 50)?></p>
						  <div class="button"><span><a href="details.php?proid=<?php echo $resultsamsung['productId']?>">Đặt hàng</a></span></div>
					</div>
				</div>
				<?php
			   }
			}
			   ?>
			</div>
			<div class="section group">
			<?php 
				$getLastestOppo = $product->getLastestOppo();
				if($getLastestOppo){
					while($resultoppo = $getLastestOppo->fetch_assoc()){
				?>			
				<div class="listview_1_of_2 images_1_of_2">
					<div class="listimg listimg_2_of_1">
						  <a href="preview.php"><img src="admin/uploads/<?php echo $resultoppo['image']?>" alt="" / ></a>
					</div>
					<div class="text list_2_of_1">
						  <h2>Samsung</h2>
						  <p><?php  echo  $fm->textShorten($resultoppo['productName'], 50)?></p>
						  <div class="button"><span><a href="details.php?proid=<?php echo $resultoppo['productId']?>">Đặt hàng</a></span></div>
					</div>
				</div>
				<?php
			   }
			}
			   ?>			
				<?php 
				$getLastestApple = $product->getLastestApple();
				if($getLastestApple){
					while($resultapple = $getLastestApple->fetch_assoc()){
				?>			
				<div class="listview_1_of_2 images_1_of_2">
					<div class="listimg listimg_2_of_1">
						  <a href="preview.php"><img src="admin/uploads/<?php echo $resultapple['image']?>" alt="" / ></a>
					</div>
					<div class="text list_2_of_1">
						  <h2>APPLE</h2>
						  <p><?php  echo  $fm->textShorten($resultapple['productName'], 50)?></p>
						  <div class="button"><span><a href="details.php?proid=<?php echo $resultapple['productId']?>">Đặt hàng</a></span></div>
					</div>
				</div>
				<?php
			   }
			}
			   ?>
			</div>
		  <div class="clear"></div>
		</div>
			 <div class="header_bottom_right_images">
		   <!-- FlexSlider -->
             
			<section class="slider">
				  <div class="flexslider">
					<ul class="slides">
						<li><img src="images/1.jpg" alt=""/></li>
						<li><img src="images/2.jpg" alt=""/></li>
						<li><img src="images/3.jpg" alt=""/></li>
						<li><img src="images/4.jpg" alt=""/></li>
				    </ul>
				  </div>
	      </section>
<!-- FlexSlider -->
	    </div>
	  <div class="clear"></div>
  </div>	