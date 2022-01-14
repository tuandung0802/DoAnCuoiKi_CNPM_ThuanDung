<?php

    $filepath = realpath(dirname(__FILE__));
     include_once  ($filepath.'/../lib/database.php');
     include_once  ($filepath.'/../helpers/format.php');



?>

<?php
        class product
        {
            private $db;
            private $fm;



            public function __construct()
            {
                $this->db = new Database();
                $this->fm = new Format();
            }
            public function insert_product($data, $files){
                
                $productName = mysqli_real_escape_string($this->db->link, $data['productName']);
                $brand = mysqli_real_escape_string($this->db->link,$data['brand']);
                $category = mysqli_real_escape_string($this->db->link, $data['category']);
                $product_desc = mysqli_real_escape_string($this->db->link, $data['product_desc']);
                $price = mysqli_real_escape_string($this->db->link, $data['price']);
                $type = mysqli_real_escape_string($this->db->link,$data['type']);

                    /// kiểm tra hình ảnh và lấy hình ảnh cho vào folder Upload
                $permited = array('jpg', 'jpeg', 'png', 'gif');
                $file_name = $_FILES['image']['name'];
                $file_size = $_FILES['image']['size'];
                $file_temp = $_FILES['image']['tmp_name'];

                $div = explode('.', $file_name);
                $file_ext = strtolower(end($div));
                $unique_image = substr(md5(time()), 0, 10).'.'.$file_ext;
                $uploaded_image = "uploads/".$unique_image;

                if($productName=="" || $brand=="" || $category=="" || $product_desc=="" || $price=="" || $type=="" || $file_name == ""){
                    $alert = "<span class='error'>Các mục không được để trống</span>";
                    return $alert;
                }else{
                    move_uploaded_file($file_temp, $uploaded_image);
                    $query = "INSERT INTO tbl_product(productName, brandId, catId, product_desc, price, type, image) VALUES ('$productName','$brand','$category','$product_desc','$price','$type','$unique_image')";
                    $result = $this->db->insert($query);
                    if($result){
                        $alert = "<span class='success'>Thêm sản phẩm thành công</span>";
                        return $alert;
                    }else{
                        $alert = "<span class='error'>Thêm  sản phẩm không thành công</span>";
                        return $alert;
                    }       
                }
            }
            public function show_product(){
                $query = "
                SELECT tbl_product.*, tbl_category.catName, tbl_brand.brandName

                FROM tbl_product INNER JOIN tbl_category ON tbl_product.catId = tbl_category.catId

                INNER JOIN tbl_brand ON tbl_product.brandId = tbl_brand.brandId
                
                order by tbl_product.productId desc";
                    $result = $this->db->select($query);
                    return $result;
            }
            public function update_product($data,$files, $id){
                $productName = mysqli_real_escape_string($this->db->link, $data['productName']);
                $brand = mysqli_real_escape_string($this->db->link,$data['brand']);
                $category = mysqli_real_escape_string($this->db->link, $data['category']);
                $product_desc = mysqli_real_escape_string($this->db->link, $data['product_desc']);
                $price = mysqli_real_escape_string($this->db->link, $data['price']);
                $type = mysqli_real_escape_string($this->db->link,$data['type']);

                    /// kiểm tra hình ảnh và lấy hình ảnh cho vào folder Upload
                $permited = array('jpg', 'jpeg', 'png', 'gif');
                $file_name = $_FILES['image']['name'];
                $file_size = $_FILES['image']['size'];
                $file_temp = $_FILES['image']['tmp_name'];

                $div = explode('.', $file_name);
                $file_ext = strtolower(end($div));
                $unique_image = substr(md5(time()), 0, 10).'.'.$file_ext;
                $uploaded_image = "uploads/".$unique_image;



                 if($productName=="" || $brand=="" || $category=="" || $product_desc=="" || $price=="" || $type=="" ){
                    $alert = "<span class='error'>Các mục không được để trống</span>";
                    return $alert;
                }else{
                    if(!empty($file_name)){
                            // Nếu chọn ảnh
                        if($file_size > 20480) {
                            $alert = "<span class='error'>Ảnh phải ít hơn 2MB </span>";
                        return $alert;
                        }
                        elseif (in_array($file_ext, $permited) === false)
                        {
                        $alert = "<span class='error'>Bạn có thể đăng tải:-".implode(', ',$permited)."</span>";
                        return $alert;
                        }
                    $query = "UPDATE tbl_product SET 
                    productName = '$productName',
                    brandId = '$brand', 
                    catId = '$category', 
                    type = '$type', 
                    price = '$price', 
                    image = '$unique_image', 
                    product_desc = '$product_desc'
                    WHERE productId = '$id'";
                    }else{
                        $query = "UPDATE tbl_product SET 
                     productName = '$productName',
                    brandId = '$brand', 
                    catId = '$category', 
                    type = '$type', 
                    price = '$price', 
                    product_desc = '$product_desc'
                    WHERE productId = '$id'";
                    }   
                    $result = $this->db->update($query);
                    if($result){
                        $alert = "<span class='success'>Sửa  sản phẩm thành công</span>";
                        return $alert;
                    }else{
                        $alert = "<span class='error'>Sửa sản phẩm không thành công</span>";
                        return $alert;
                    }   
            }}
        
            public function getproductbyId($id){
                $query = "SELECT * FROM tbl_product WHERE productId = '$id'";
                    $result = $this->db->select($query);
                    return $result;
            }

            public function del_product($id){
                $query = "DELETE FROM tbl_product WHERE productId = '$id'";
                    $result = $this->db->delete($query);
                    if($result){
                        $alert = "<span class='success'>Xóa sản phẩm thành công</span>";
                        return $alert;
                    }else{
                        $alert = "<span class='error'>Xóa sản phẩm không thành công</span>";
                        return $alert;
                    }
                    return $result;
            }
            //END BACKEND
            public function getproduct_feathered(){
                $query = "SELECT * FROM tbl_product WHERE type = '1'";
                    $result = $this->db->select($query);
                    return $result;
            }
            public function getproduct_new(){
                $query = "SELECT * FROM tbl_product order by productId desc LIMIT 4";
                    $result = $this->db->select($query);
                    return $result;
            }
            public function get_details($id){

                $query = "
                SELECT tbl_product.*, tbl_category.catName, tbl_brand.brandName

                FROM tbl_product INNER JOIN tbl_category ON tbl_product.catId = tbl_category.catId

                INNER JOIN tbl_brand ON tbl_product.brandId = tbl_brand.brandId where tbl_product.productId='$id'
                
                ";
                    $result = $this->db->select($query);
                    return $result;
            }
            public function getLastestDell(){
                $query = "SELECT * FROM tbl_product where brandId='2' order by productId desc LIMIT 1";
                    $result = $this->db->select($query);
                    return $result;
            }
            public function getLastestApple(){
                $query = "SELECT * FROM tbl_product where brandId='3' order by productId desc LIMIT 1";
                    $result = $this->db->select($query);
                    return $result;
            }
            public function getLastestSamsung(){
                $query = "SELECT * FROM tbl_product where brandId='4' order by productId desc LIMIT 1";
                    $result = $this->db->select($query);
                    return $result;
            }
            public function getLastestOppo(){
                $query = "SELECT * FROM tbl_product where brandId='5' order by productId desc LIMIT 1";
                    $result = $this->db->select($query);
                    return $result;
            }

            public function getpdDell(){
                $query = "SELECT * FROM tbl_product where brandId='2' order by productId desc ";
                    $result = $this->db->select($query);
                    return $result;
            }
            public function getpdApple(){
                $query = "SELECT * FROM tbl_product where brandId='3' order by productId desc ";
                    $result = $this->db->select($query);
                    return $result;
            }
            public function getpdSamsung(){
                $query = "SELECT * FROM tbl_product where brandId='4' order by productId desc ";
                    $result = $this->db->select($query);
                    return $result;
            }
            public function getpdOppo(){
                $query = "SELECT * FROM tbl_product where brandId='5' order by productId desc ";
                    $result = $this->db->select($query);
                    return $result;
            }


        }

        
        
?>