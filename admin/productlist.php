<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php include '../classes/brand.php';?>
<?php include '../classes/category.php';?>
<?php include '../classes/product.php';?>
<?php include_once '../helpers/format.php';?>
<?php
			$fm = new Format();
			?>
<div class="grid_10">
    <div class="box round first grid">
        <h2>Post List</h2>
        <div class="block">  
            <table class="data display datatable" id="example">
			<thead>
				<tr>
					<th>ID</th>
					<th>Tên sản phẩm</th>
					<th>Giá</th>
					<th>Ảnh</th>
					<th>Danh mục</th>
					<th>Thương hiệu</th>
					<th>Mô tả</th>
					<th>Loại</th>
					<th>Hành động</th>
				</tr>
			</thead>
			<tbody>

			<?php
			$pd = new product();

			$pdlist = $pd->show_product();
			if($pdlist){
				$i=0;
				while($result = $pdlist->fetch_assoc()){
					$i++;

				
			?>
				<tr class="odd gradeX">
					<td><?php echo $i?></td>
					<td><?php echo $result['productName']?></td>
					<td><?php echo $result['price']?></td>
					<td> <img src="uploads/<?php echo $result['image']?>" width="80" center></td>
					<td><?php echo $result['catId']?></td>
					<td><?php echo $result['brandId']?></td>
					<td><?php echo $fm->textShorten($result['product_desc'],50)?></td>
					<td><?php 
					if($result['type']==0){
						echo 'Nổi bật';
					}else{
						echo 'Bình thường' ;
					}
					?></td>
					
					
					<td><a href="">Edit</a> || <a href="">Delete</a></td>
				</tr>
				<?php
				}
			}
				?>
			</tbody>
		</table>

       </div>
    </div>
</div>

<script type="text/javascript">
    $(document).ready(function () {
        setupLeftMenu();
        $('.datatable').dataTable();
		setSidebarHeight();
    });
</script>
<?php include 'inc/footer.php';?>
