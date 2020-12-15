<?php
    include_once "../database/crud.php";


    class Carrinho extends Crud{

        function buscaProdutos($search){
            $sql = "SELECT * FROM tb_produtos WHERE produto like '%{$search}%' or codigo_barras LIKE '{$search}%'
            ORDER BY produto ASC LIMIT 5;";

            print_r(json_encode(parent::read($sql)));
        }

        function salvarVenda($json){
            $obj_venda = json_decode($json);
            //salva endereço entrega
            $obj_address = $obj_venda->{'address'};
            $sql = "INSERT INTO tb_entregas VALUES ( 0, 
            '{$obj_address->{'zipcode'}}', 
            '{$obj_address->{'address'}}',
            '{$obj_address->{'number'}}',
            '{$obj_address->{'district'}}',
            '{$obj_address->{'city'}}',
            '{$obj_address->{'uf'}}');";

            parent::create($sql);

            //salva venda
            $sql = "INSERT INTO tb_vendas VALUES ( 0, 
            (SELECT id_entrega FROM tb_entregas ORDER BY id_entrega DESC LIMIT 1), 
            '{$obj_venda->{'date'}}');";

            parent::create($sql);

            //salva lista de produtos
            
            foreach ($obj_venda->{'productsId'} as $key => $id_produto) {
                    $sql = "INSERT INTO tb_carrinhos VALUES ( 0, 
                (SELECT id_venda FROM tb_vendas ORDER BY id_venda DESC LIMIT 1), 
                {$id_produto},
                (SELECT valor FROM tb_produtos WHERE id_produto = {$id_produto} LIMIT 1));";

                parent::create($sql);
            }
            
        }
    }



    if (isset($_POST['json'])) {
        $carrinho = new Carrinho();
        $carrinho->salvarVenda($_POST['json']);
    }

    if (isset($_GET['search'])) {
        $carrinho = new Carrinho();
        $carrinho->buscaProdutos($_GET['search']);
    }
