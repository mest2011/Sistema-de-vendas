<?php
    include_once 'connection.php';
    class Crud{

        static function create($sql){
            $db = new Db();
            
            $conn = $db->connect();

            $result = $conn->query($sql);
            
            if ($result === TRUE) {
                $resposta = "Dado(s) salvo(s) com sucesso!";
              } else {
                $resposta = "Erro ao salvar o(s) dado(s)";
            }

            $db->close($conn);
            return $resposta; 
        }

        static function read($sql){
            $data = array();

            $db = new Db();
            
            $conn = $db->connect();

            $result = $conn->query($sql);
               
            $lines = $result->num_rows;


            if($lines > 0){
                while ($row = $result->fetch_assoc()) {  
                    array_push($data, $row);
                }
            }else{
                $data = "0 dados encontrados";
            }

            $db->close($conn);
            return $data;
            
        }

        static function update($sql){
            $db = new Db();
            
            $conn = $db->connect();

            $result = $conn->query($sql);
            
            if ($result === TRUE) {
                $resposta = "Dado(s) atualizado(s) com sucesso!";
              } else {
                $resposta = "Erro ao atualizar o(s) dado(s)";
            }

            $db->close($conn);
            return $resposta; 
        }

        static function delete($sql){
            $db = new Db();
            
            $conn = $db->connect();

            $result = $conn->query($sql);
            
            if ($result === TRUE) {
                $resposta = "Dado(s) excluido(s) com sucesso!";
              } else {
                $resposta = "Erro ao excluir o(s) dado(s)";
            }

            $db->close($conn);
            return $resposta; 
        }
    }
    
    

    
?>