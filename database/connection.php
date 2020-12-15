<?php

class Db{
    
    private $DB_PORT = '127.0.0.1:3306'; 
    private $DB_USER = 'root'; 
    private $DB_PASSWORD = 'root'; 
    private $DB_DATABASE = 'sistema_de_vendas';

   
    function connect(){
        
        $conn = mysqli_connect($this->DB_PORT, $this->DB_USER, $this->DB_PASSWORD) or die("Erro na conexão " . mysqli_error());
        
        mysqli_select_db($conn, $this->DB_DATABASE) or die("Erro ao selecionar o banco " . mysqli_error());
        
        return $conn;
    }

    function close($conn){
        mysqli_close($conn);
    }
}
    

?>