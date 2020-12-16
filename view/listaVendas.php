<?php
include_once "../controller/vendas_controller.php";


$vendas = new Vendas();
$result = json_decode($vendas->listarVendas(), true);
$printcontent = "";
foreach ($result as $key => $value) {
    $total = number_format($value['totalvalor'], 2, ',', '.');
    $printcontent .= "<tr><td>{$value['data_venda']}</td><td>R$ {$total}</td><td>{$value['endereco']}</td><td>{$value['listadeprodutos']}</td><td></td></tr>";
}


?>

<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vendas</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">

    <link rel="icon" type="imagem/png" href="imagens/logo-carrinho.png" />


    <link rel="stylesheet" href="style/style.css">
</head>

<body>
    <header>
    <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #e3f2fd;">
        <a class="navbar-brand" href="index.php">
                <img src="imagens/logo-carrinho.png" data-toggle="collapse" width="30" height="30" alt="">
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                        <a class="nav-link" href="index.php">Cadastrar</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="listaVendas.php">Listar vendas</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <main>
        <table class="table table-striped">
            <thead class="thead-dark">
                <th>Data</th>
                <th>Valor total</th>
                <th>Endereço</th>
                <th>Produtos</th>
                <th><button onclick="xlsx()" class="btn btn-info">Baixar</button></th>
            </thead>
            <tbody>
                <?php echo $printcontent ?>
            </tbody>
        </table>
    </main>

    <script>
        function xlsx() {
            try {
                var wb = XLSX.utils.table_to_book(document.getElementsByTagName('table')[0], {
                    sheet: "planilha",
                    raw: true
                });

                var wscols = [{
                        wch: 15
                    },
                    {
                        wch: 15
                    },
                    {
                        wch: 15
                    },
                    {
                        wch: 15
                    },
                    {
                        wch: 15
                    }
                ];

                wb["Sheets"]["planilha"]["!cols"] = wscols;

                var wbout = XLSX.write(wb, {
                    bookType: 'xlsx',
                    type: 'binary'
                });
                saveAs(new Blob([s2ab(wbout)], {
                    type: "application/octet-stream"
                }), 'Extrato_de_vendas' + '.xlsx');

            } catch (err) {
                console.log(err);
            }
        }

        function s2ab(s) {
            let buf = new ArrayBuffer(s.length);
            let view = new Uint8Array(buf);
            for (let i = 0; i < s.length; i++) view[i] = s.charCodeAt(i) & 0xFF;
            return buf;
        }
    </script>
    <script src="script/FileSaver.min.js"></script>
    <script src="script/xlsx.full.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>