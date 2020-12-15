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
            <a class="navbar-brand" href="#">
                <img src="imagens/logo-carrinho.png" width="30" height="30" alt="">
            </a>

            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Cadastrar venda</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Vendas</a>
                    </li>
                </ul>
            </div>
        </nav>
    </header>
    <main>

        <div id="cadastro">
            <h1>Cadastro de venda</h1>
            <form action="#" id="venda" class="form" method="POST">
                <div class="form-group">
                    <label for="product">Produto</label>
                    <input class="form-control col-sm-4" type="text" name="product" id="product" oninput="findProduct()">
                    <small id="product-finder" class="form-text text-muted">Abaixo aparecera a lista de produtos similares ao que foi digitado, selecione o produto que deseja!</small>
                    <span id="product-list"></span>
                </div>
                <div class="form-group">
                    <label for="date">Data da venda</label>
                    <input class="form-control col-sm-2" type="date" id="date" name="date" required>
                </div>
                <div class="form-group">
                    <label for="cep">CEP</label>

                    <div id="caixaBusca">
                        <input class="form-control col-sm-3" type="search" id="cep" name="cep" placeholder="00000-000" aria-label="Search" required>
                        <div class="btn btn-outline-success  col-sm-1" onclick="buscarEndereco(document.getElementById('cep').value)">Procurar</div>
                    </div>
                    <small id="cep-finder" class="form-text text-muted">Digite o CEP para buscar o endereço de entrega!</small>
                    <span id="endereco">

                    </span>
                </div>

            </form>
        </div>
        <div id="carrinho">
            <h2>Produtos no carrinho</h2>
            <table id="nota" class="table table-striped">
                <thead class="thead-dark">
                    <th scope="col">Produto</th>
                    <th scope="col">Valor</th>
                    <th scope="col"></th>
                </thead>
                <tbody>
                    <tr id="total">
                        <td>Total:</td>
                    </tr>
                </tbody>
                <tfoot>
                </tfoot>
            </table>
        </div>
        <button type="submit" class="btn btn-success" form="venda">Salvar venda</button>
    </main>
    <script src="script/script.js"></script>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</body>

</html>