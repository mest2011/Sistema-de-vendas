<?php
    include_once "../database/crud.php";

    class Vendas extends Crud{
        function listarVendas(){
            $sql = "SELECT DATE_FORMAT(data_venda, '%d/%m/%Y') as data_venda,
             SUM(ca.valor_produto) as totalvalor,
              CONCAT('CEP: ',cep,', Logradouro: ',endereco,', numero: ',numero,', bairro: ',bairro,', cidade: ',cidade,', uf: ', uf) AS endereco,
            GROUP_CONCAT(produto SEPARATOR ', ') AS listadeprodutos  
           FROM tb_carrinhos as ca 
           inner join tb_vendas AS ve ON ca.id_venda = ve.id_venda
            INNER JOIN tb_entregas AS en ON en.id_entrega = ve.id_entrega
            INNER JOIN tb_produtos as pr ON pr.id_produto = ca.id_produto
            GROUP BY ve.id_venda";

            $venda_endereco = json_encode(parent::read($sql));
            return $venda_endereco;
            
        }
    }



    if (isset($_GET['allsales'])) {
        $vendas = new Vendas();
        print_r($vendas->listarVendas());
    }



?>