function call() {
    var msg   = $('#createCandidates').serialize();
    console.log(msg);
    $.ajax({
        type: 'POST',
        url: '/create/add/',
        data: msg,
        success: function(data) {
           alert(data);
        },
        error:  function(xhr, str){
            alert('Возникла ошибка: ' + xhr.responseCode);
        }
    });

}

