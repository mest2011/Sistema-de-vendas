function findProduct(termo) {
    loadDoc2(termo);
}


function listProducts(products) {

    document.getElementById('product-list').style.display = "block";
    let lista = document.getElementById("product-list");

    if (products == "0 dados encontrados") { lista.innerHTML = ''; return; };

    var objItem;

    let resultado = "<table class='table table-hover'>";
    for (var item in products) {
        objItem = JSON.stringify(products[item]);
        resultado += "<tr onclick='selecteditem(" + objItem + ")'><td>" + products[item]['produto'] + "</td></tr>";
    }
    resultado += "</table>";
    lista.innerHTML = resultado;
}


const loadDoc2 = async(termo) => {
    try {
        const response = await fetch(`../controller/carrinho_controller.php?search=${termo}`);
        const resultJson = await response.json();
        listProducts(resultJson);
    } catch (error) {

    }


}


function selecteditem(dado) {
    let tabela = document.getElementById('nota').getElementsByTagName('tbody')[0];
    document.getElementById('carrinho').style.display = "block";
    document.getElementById('product').value = "";
    document.getElementById('product-list').style.display = "none";

    //nova linha
    var newRow = tabela.insertRow();

    //id oculto
    var newCell = newRow.insertCell();
    newCell.id = "produto" + (tabela.rows.length - 2);
    var newText = document.createTextNode(dado['id_produto']);
    newCell.setAttribute('style', 'display:none');
    newCell.appendChild(newText);

    //nome produto
    newCell = newRow.insertCell();
    newText = document.createTextNode(dado['produto']);
    newCell.appendChild(newText);

    //valor
    newCell = newRow.insertCell();
    newCell.className = "valor";
    newText = document.createTextNode(dado['valor']);
    newCell.appendChild(newText);

    //excluir
    newCell = newRow.insertCell();
    newText = document.createTextNode("Excluir");
    newCell.setAttribute('onclick', 'deleteRow(this.parentNode.parentNode.rowIndex)');
    newCell.className = "excluir";
    newCell.appendChild(newText);

    calculaTotal();
}


function calculaTotal() {

    excluirTotal();

    let tabela = document.getElementById('nota').getElementsByTagName('tbody')[0];
    let tbodyRowCount = tabela.rows.length;

    let newRow = tabela.insertRow();
    newRow.id = "total";
    let newCell = newRow.insertCell();
    let newText = document.createTextNode("");
    newCell.appendChild(newText);
    newCell = newRow.insertCell();

    let els = document.getElementsByClassName("valor");
    let valorcalculado = 0;
    [].forEach.call(els, function(el) {
        valorcalculado += parseFloat(el.innerHTML);
    });
    newText = document.createTextNode("Total: " + valorcalculado);
    newCell.setAttribute('colspan', '2');
    newCell.appendChild(newText);



}

function excluirTotal() {
    document.getElementById('total').remove();
}

function deleteRow(i) {
    document.getElementById('nota').getElementsByTagName('tbody')[0].deleteRow(i);
    calculaTotal()
}

//enviar dados para o backend

function sendDados() {
    tabela = document.getElementById('venda');
    let venda = {
        date: document.getElementById('date').value,
        address: {
            zipcode: document.getElementById('cep').value,
            address: document.getElementById('logradouro').value,
            number: document.getElementById('numero').value,
            district: document.getElementById('bairro').value,
            city: document.getElementById('cidade').value,
            uf: document.getElementById('uf').value
        },
        productsId: listaDeProdutos()
    }

    campoJson = document.getElementById('json');
    campoJson.value = JSON.stringify(venda);

    //tabela.submit();
}

function listaDeProdutos() {
    var tab = document.getElementById('nota').getElementsByTagName('tbody')[0];
    var products = [];

    for (i = 0; i < (tab.rows.length - 1); i++) {
        str = document.getElementById('produto' + i).innerHTML;
        products.push(str);
    }

    return products;
}



//Buscar endereço

function buscarEndereco(cep) {
    cep = cep.replace(/-/gi, "");
    procuraCep(cep);
}

const procuraCep = async(cep) => {
    try {
        const response = await fetch(`https://viacep.com.br/ws/${cep}/json/unicode/`);
        const resultJson = await response.json();
        imprimeEndereco(resultJson);
    } catch (error) {
        document.getElementById('endereco').innerHTML = "<p>Erro ao buscar CEP - CEP inválido</p>"
    }


}

function imprimeEndereco(json_address) {
    let endereco = document.getElementById('endereco');
    endereco.innerHTML =
        "<label for=\"logradouro\">Logradouro</label>" +
        "<input class=\"form-control col-sm-4\" type='text' id='logradouro' name='logradouro' value='" + json_address['logradouro'] + "' required>" +
        "<label for=\"numero\">Número</label>" +
        "<input class=\"form-control col-sm-2\" type='number' id='numero' name='numero' value='' required>" +
        "<label for=\"bairro\">Bairro</label>" +
        "<input class=\"form-control col-sm-4\" type='text' id='bairro' name='bairro' value='" + json_address['bairro'] + "' required>" +
        "<label for=\"cidade\">Cidade</label>" +
        "<input class=\"form-control col-sm-4\" type='text' id='cidade' name='cidade' value='" + json_address['localidade'] + "' required>" +
        "<label for=\"uf\">UF</label>" +
        "<input class=\"form-control col-sm-4\" type='text' id='uf' name='uf' value='" + json_address['uf'] + "' maxlength='2' required>";
}