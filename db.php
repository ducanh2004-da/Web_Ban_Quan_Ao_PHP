<?php
require_once 'config.php';
?>


<?php
class Database{
    public $host=DB_HOST;
    public $user=DB_USER;
    public $pass=DB_PASS;
    public $dbname=DB_NAME;

    public $link;
    public $error;
    public function __construct(){
        $this->connectDB();
    }
    private function connectDB(){
    // dùng DB_HOST và DB_PORT
    $this->link = @new mysqli($this->host, $this->user, $this->pass, $this->dbname, defined('DB_PORT') ? DB_PORT : 3306);

    if ($this->link->connect_errno) {
        $this->error = "Connection failed ({$this->link->connect_errno}): " . $this->link->connect_error;
        // optional: throw new Exception($this->error);
        return false;
    }
    $this->link->set_charset('utf8mb4');
    return true;
}
    //Select or read data
    public function select($query){
        $result = mysqli_query($this->link,$query) or die(mysqli_error($this->link));
        //  $num=mysqli_num_rows($query);
        if($result->num_rows > 0){
            return $result;
        }else{
            return false;
        }
    }
    //Insert data
    public function insert($query){
        $insert_row = mysqli_query($this->link,$query) or die(mysqli_error($this->link));
        if($insert_row){
            return $insert_row;
        }else{
            return false;
        }
    }

    //Update data

    public function update($query){
        $update_row = mysqli_query($this->link,$query) or die(mysqli_error($this->link));
        if($update_row){
            return $update_row;
        }else{
            return false;
        }
    }

    //Delete Data
    public function delete($query){
        $delete_row = mysqli_query($this->link,$query) or die(mysqli_error($this->link));
        if($delete_row){
            return $delete_row;
        }else{
            return false;
        }
    }
}
?>