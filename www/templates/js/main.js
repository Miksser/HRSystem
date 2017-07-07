$(document).ready(function () {

    $('#create').click(function () {

        var form = $('#createForm').serialize();
        var CreateBtn = $('#cvc').serialize();
        var data = form + '&' + CreateBtn.replace(/=/g, "[]=");
        sendInfo('/method/createposition/', data)

    });

    $('#update').click(function () {

        var form = $('#createForm').serialize();
        var CreateBtn = $('#cvc').serialize();
        var data = form + '&' + CreateBtn.replace(/=/g, "[]=");
        console.log(data);
        sendInfo('/method/updateposition/', data)

    });
    var flag = false;
    $('.AttachedInfo').click(function () {
        if (!flag) {
            $('.showInfo').css('display', 'table-row');
        } else {
            $('.showInfo').css('display', 'none');
        }

    });
})
function removeFromPosition(itemId, position) {
    if (position == 'can_id') {
        var delete_id = 'vac_id=' + itemId;
    } else if (position == 'vac_id') {
        var delete_id = 'can_id=' + itemId;
    } else {
        return false;
    }

    var position_id = $('#position').serialize();
    var data = position_id + "&" + delete_id;
    var send = sendInfo('/method/removeposition/', data);
    if (send) {
        $('#addInfo_' + itemId).show();
        $('#removeInfo_' + itemId).hide();
    }
};


function addFromPosition(itemId, position) {
    if (position == 'can_id') {
        var add_id = 'vac_id=' + itemId;
    } else if (position == 'vac_id') {
        var add_id = 'can_id=' + itemId;
    } else {
        return false;
    }

    var position_id = $('#position').serialize();
    var data = 'table=comb_vac_cand' + "&" + position_id + "&" + add_id;
    var send = sendInfo('/method/addposition/', data);
    if (send) {
        $('#addInfo_' + itemId).hide();
        $('#removeInfo_' + itemId).show();
    }
};

function sendInfo(url, data) {
    var result;
    console.log(data);
    $.ajax({
        type: 'POST',
        url: url,
        data: data,
        async: false,
        success: function (data) {
            result = true;
        },
        error: function (xhr, str) {
            result = false;
        }
    });
    return result;
}
