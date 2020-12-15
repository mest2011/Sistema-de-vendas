function findProduct() {
    loadDoc();
}

function listProducts(products) {
    products = [{
        "name": "Butter - Salted, Micro"
    }, {
        "name": "Ice Cream Bar - Oreo Sandwich"
    }, {
        "name": "Beef - Bresaola"
    }, {
        "name": "Lobster - Baby, Boiled"
    }, {
        "name": "Muffin - Mix - Bran And Maple 15l"
    }];
    document.getElementById('product-list').style.display = "block";
    let lista = document.getElementById("product-list");
    let resultado = "<table class='table table-hover'>";
    for (var item in products) {
        resultado += "<tr onclick=\"selecteditem('" + products[item]['name'] + "')\"><td>" + products[item]['name'] + "</td></tr>";
    }
    resultado += "</table>";
    lista.innerHTML = resultado;
}


function loadDoc() {
    let temp;
    var xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            listProducts(this.responseText);
        }
    };
    xhttp.open("GET", "teste.txt", true);
    xhttp.send();
}

function selecteditem(id) {
    let tabela = document.getElementById('nota').getElementsByTagName('tbody')[0];
    document.getElementById('carrinho').style.display = "block";
    document.getElementById('product').value = "";
    document.getElementById('product-list').style.display = "none";


    var newRow = tabela.insertRow();

    var newCell = newRow.insertCell();
    var newText = document.createTextNode(id);
    newCell.appendChild(newText);

    var newCell = newRow.insertCell();
    newCell.className = "valor";
    var newText = document.createTextNode(Math.floor(Math.random() * 100));
    newCell.appendChild(newText);

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
    newCell.appendChild(newText);

    newCell = newRow.insertCell();
    newText = document.createTextNode("");
    newCell.appendChild(newText);


}

function excluirTotal() {
    document.getElementById('total').remove();
}

function deleteRow(i) {
    document.getElementById('nota').getElementsByTagName('tbody')[0].deleteRow(i);
    calculaTotal()
}