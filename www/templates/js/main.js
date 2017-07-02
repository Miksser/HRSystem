$(document).ready(function () {

    $('#create').click(function () {

        var form = $('#createCandidates').serialize();
        var vacancy = $('#vacancy').serialize();
        var data = form + '&' + vacancy.replace(/=/g, "[]=");

        $.ajax({
            type: 'POST',
            url: '/create/add/',
            data: data,
            success: function (data) {
                alert(data);
            },
            error: function (xhr, str) {
                alert('Возникла ошибка: ' + xhr.responseCode);
            }
        });
    })
})


