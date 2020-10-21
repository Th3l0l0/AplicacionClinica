//Load Data in Table when documents is ready  
$(document).ready(function () {
    loadData();
    listDistritos();
});  


//Load Data function  
function loadData() {
    $.ajax({
        url: "/Pacientes/List",
        type: "GET",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            var html = '';
            $.each(result, function (key, item) {
                html += `<tr>`;
                html += `<td>` + item.codpac + `</td>`;
                html += `<td>` + item.nompac + `</td>`;
                html += `<td>` + item.dnipac + `</td>`;
                html += `<td>` + item.tel_cel + `</td>`;
                html += `<td>` + item.dirpac + `</td>`;
                html += `<td>` + item.nomdis + `</td>`;
                html += `<td><a href="#" onclick="return getbyID('${item.codpac}');">Editar</a> | <a href="#" onclick="Delete('${item.codpac}');">Eliminar</a></td>`;
                html += `</tr>`;
            });
            $('.tbody').html(html);
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}

function listDistritos() {
    $.ajax({
        type: "GET",
        url: "/Pacientes/ListDistritos",
        data: "{}",
        success: function (data) {
            var s = `<option value="-1">Seleccione un distrito</option>`;
            for (var i = 0; i < data.length; i++) {
                s += '<option value="' + data[i].coddis + '">' + data[i].nomdis + '</option>';
            }
            $("#distritos").html(s);
        }
    });
}

//Add Data Function   
function Add() {
    var res = validate();
    if (res == false) {
        return false;
    }
    
    var pacObj = {
        codpac: $('#codpac').val(),
        nompac: $('#nompac').val(),
        dnipac: $('#dnipac').val(),
        tel_cel: $('#tel_cel').val(),
        dirpac: $('#dirpac').val(),
        coddis: $('#distritos').val()
    };
    $.ajax({
        url: "/Pacientes/Add",
        data: JSON.stringify(pacObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    form = document.querySelector('form');
    form.reset();
}

//Function for getting the Data Based upon Employee ID  
function getbyID(EmpID) {
    
    $('#nompac').css('border-color', 'lightgrey');
    $('#dnipac').css('border-color', 'lightgrey');
    $('#tel_cel').css('border-color', 'lightgrey');
    $('#dirpac').css('border-color', 'lightgrey');
    $('#coddis').css('border-color', 'lightgrey');
    $.ajax({
        url: "/Pacientes/getbyID",
        type: "POST",
        data: `{'codpac': '${EmpID}'}`,
        contentType: "application/json;charset=UTF-8",
        dataType: "json",
        success: function (result) {
            $('#codpac').val(result.codpac);
            $('#nompac').val(result.nompac);
            $('#dnipac').val(result.dnipac);
            $('#tel_cel').val(result.tel_cel);
            $('#dirpac').val(result.dirpac);
            $(`#distritos option[value='${result.coddis}']`).prop('selected', true);

            $('#myModal').modal('show');
            $('#btnUpdate').show();
            $('#btnAdd').hide();
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
    return false;
}

//function for updating employee's record  
function Update() {
    var res = validate();
    if (res == false) {
        return false;
    }
    var pacObj = {
        codpac: $('#codpac').val(),
        nompac: $('#nompac').val(),
        dnipac: $('#dnipac').val(),
        tel_cel: $('#tel_cel').val(),
        dirpac: $('#dirpac').val(),
        coddis: $('#distritos').val(),
    };

    $.ajax({
        url: "/Pacientes/Update",
        data: JSON.stringify(pacObj),
        type: "POST",
        contentType: "application/json;charset=utf-8",
        dataType: "json",
        success: function (result) {
            loadData();
            $('#myModal').modal('hide');
            $('#codpac').val("");
            $('#nompac').val("");
            $('#dnipac').val("");
            $('#tel_cel').val("");
            $('#dirpac').val("");
            $('#distritos').val("");
        },
        error: function (errormessage) {
            alert(errormessage.responseText);
        }
    });
}  

//function for deleting employee's record  
function Delete(ID) {
    var ans = confirm("Estas seguro de eliminar este registro?");
    if (ans) {
        $.ajax({
            url: "/Pacientes/Delete/",
            type: "POST",
            data: `{"codpac": "${ID}"}`,
            contentType: "application/json;charset=UTF-8",
            dataType: "json",
            success: function (result) {
                loadData();
            },
            error: function (errormessage) {
                alert(errormessage.responseText);
            }
        });
    }
}

//Function for clearing the textboxes  
function clearTextBox() {
    $('#codpac').val("");
    $('#nompac').val("");
    $('#dnipac').val("");
    $('#tel_cel').val("");
    $('#dirpac').val("");
    $('#btnAdd').show();
    $('#codpac').css('border-color', 'lightgrey');
    $('#nompac').css('border-color', 'lightgrey');
    $('#dnipac').css('border-color', 'lightgrey');
    $('#tel_cel').css('border-color', 'lightgrey');
    $('#dirpac').css('border-color', 'lightgrey');
    $('#coddis').css('border-color', 'lightgrey');
}


//Valdidation using jquery  
function validate() {
   var isValid = true;
    if ($('#codpac').val().trim() == "") {
        $('#codpac').css('border-color', 'Red');
        isValid = false;
   }
    else {
        $('#codpac').css('border-color', 'lightgrey');
    }
    if ($('#nompac').val().trim() == "") {
        $('#nompac').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#nompac').css('border-color', 'lightgrey');
    }
    if ($('#dnipac').val().trim() == "") {
        $('#dnipac').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#dnipac').css('border-color', 'lightgrey');
    }
    if ($('#tel_cel').val().trim() == "") {
        $('#tel_cel').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#tel_cel').css('border-color', 'lightgrey');
    }
    if ($('#dirpac').val().trim() == "") {
        $('#dirpac').css('border-color', 'Red');
        isValid = false;
    }
    else {
        $('#dirpac').css('border-color', 'lightgrey');
    }
    return isValid;
}  
