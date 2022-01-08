<?php
    $filepath = realpath(dirname(__FILE__));
     include_once  ($filepath.'/../lib/database.php');
     include_once  ($filepath.'/../helpers/format.php');



?>

<?php
        class cart
        {
            private $db;
            private $fm;



            public function __construct()
            {
                $this->db = new Database();
                $this->fm = new Format();
            }
            public function add_to_cart($quantity, $id){
                $quantity = $this->fm->validation($quantity);

                $quantity = mysqli_real_escape_string($this->db->link, $quantity);
                $sId = mysqli_real_escape_string($this->db->link,$id);
                $sId=session_id();

                $query = "SELECT * FROM tbl_product WHERE productId = '$id'";
                $result = $this->db->select($query)->fetch_assoc();
                
                $image = $result['image'];
                $price = $result['price'];
                $productName = $result['productName'];

                $query_insert = "INSERT INTO tbl_cart(productId, quantity, sId, image, price,productName) VALUES ('$id','$quantity','$sId','$image','$price','$productName')";
                    $insert_cart = $this->db->insert($query_insert);
                    if($result){
                        header('Location:cart.php');
                    }else{
                        header('Location:404.php');
                    }       
            }
            
        }

        
        
?>