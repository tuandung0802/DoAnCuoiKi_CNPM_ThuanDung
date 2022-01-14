<?php include 'inc/header.php';?>
<?php include 'inc/sidebar.php';?>
<?php include '../classes/brand.php'?>
<?php
if(!isset($_GET['brandid']) || $_GET['brandid']==Null){
    echo "<script>window.location = 'brandlist.php'</script>";
}else{
    $id = $_GET['brandid'];
}
$brand = new brand();
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $brandName = $_POST['brandName'];
    $updateBrand = $brand->update_brand($brandName, $id); 
}

	
?>
        <div class="grid_10">
            <div class="box round first grid">
                <h2>Sửa nhà cung cấp</h2>

                
               <div class="block copyblock"> 
               <?php
                if(isset($updateBrand)){
                    echo $updateBrand;
                }
                ?>
                <?php 
                $get_brand_name = $brand->getbrandbyId($id);
                if($get_brand_name){
                    while($result = $get_brand_name->fetch_assoc()){

                ?>
                 <form action="" method="post">
                    <table class="form">	
                    				
                        <tr>
                            <td>
                                <input type="text" value = "<?php echo $result['brandName'] ?>" placeholder="Sửa thương hiệu, nhà cung cấp...." class="medium" name="brandName" />
                            </td>
                        </tr>
						<tr> 
                            <td>
                                <input type="submit" name="submit" Value="Sửa" />
                            </td>
                        </tr>
                    </table>
                    </form>

                    <?php
                         }
                        }
                    ?>
                </div>
            </div>
        </div>
<?php include 'inc/footer.php';?>