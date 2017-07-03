$(document).ready(function () {

    $('#create').click(function () {

        var form = $('#createForm').serialize();
        var CreateBtn = $('#cvc').serialize();
        var data = form + '&' + CreateBtn.replace(/=/g, "[]=");

        $.ajax({
            type: 'POST',
            url: '/create/add/',
            data: data,
            success: function (data) {
                console.log(data);
            },
            error: function (xhr, str) {
                alert('Возникла ошибка: ' + xhr.responseCode);
            }
        });
    });

    $('#update').click(function () {

        var form = $('#createForm').serialize();
        var CreateBtn = $('#cvc').serialize();
        var data = form + '&' + CreateBtn.replace(/=/g, "[]=");
        console.log(data);
        $.ajax({
            type: 'POST',
            url: '/profile/updatevacancy/',
            data: data,
            success: function (data) {
            },
            error: function (xhr, str) {
                alert('Возникла ошибка: ' + xhr.responseCode);
            }
        });
    });


})

function removeFromProfile(itemId) {
    var can_id = $('#candidate').serialize();
    var vac_id = 'vac_id=' + itemId;
    var data = can_id + "&" + vac_id;
    console.log(data);
    $.ajax({
        type: 'POST',
        url: '/profile/removevacancy/',
        data: data,
        success: function (data) {
            console.log(data);
                $('#addVacancy_' + itemId).show();
                $('#removeVacancy_' + itemId).hide();
        }
    })
};

function addFromProfile(itemId) {
    var can_id = $('#candidate').serialize();
    var data = 'table=comb_vac_cand' + "&" + can_id + "&vac_id=" + itemId;
    console.log(data);
    $.ajax({
        type: 'POST',
        url: '/profile/addvacancy/',
        data: data,
        success: function (data) {
            console.log(data);
            $('#addVacancy_' + itemId).hide();
            $('#removeVacancy_' + itemId).show();
        }
    })
};

