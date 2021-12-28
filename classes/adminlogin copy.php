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
                    $alert = "Tên danh mục không được để trống";
                    return $alert;

                }else{
                    $query = "";
                    $result = $this->db->insert($query);

                    if ($result !== false) {
                        $value = $result->fetch_assoc();
                        Session::set('adminlogin', true);
                        Session::set('adminId', $value['adminId']);
                        Session::set('adminUser', $value['adminUser']);
                        Session::set('adminName', $value['adminName']);


                        header('Location:index.php');

                    }
                }


            }
            
        }

        
        
?>