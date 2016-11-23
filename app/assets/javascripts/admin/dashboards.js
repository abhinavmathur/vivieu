$(document).on('page:change ready', function(){
    $('#tags-modal').on('shown.bs.modal', function () {
        $('#new_tag').enableClientSideValidations();
    })
});