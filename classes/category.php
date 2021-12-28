<?php
    include '../lib/database.php';
    include '../helpers/format.php';



?>

<?php
        class category
        {
            private $db;
            private $fm;



            public function __construct()
            {
                $this->db = new Database();
                $this->fm = new Format();
            }
            public function insert_category($catName){
                $catName = $this->fm->validation($catName);
                

                $catName = mysqli_real_escape_string($this->db->link, $catName);
                

                if(empty($catName)){
                    $alert = "<span class='error'>Tên danh mục không được để trống</span>";
                    return $alert;

                }else{
                    $query = "INSERT INTO tbl_category(catName) VALUES ('$catName')";
                    $result = $this->db->insert($query);
                    if($result){
                        $alert = "<span class='success'>Thêm danh mục sản phẩm thành công</span>";
                        return $alert;
                    }else{
                        $alert = "<span class='error'>Thêm danh mục sản phẩm không thành công</span>";
                        return $alert;
                    }

                    
                }


            }
            
        }

        
        
?>