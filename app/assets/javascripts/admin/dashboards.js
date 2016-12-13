$(document).on('turbolinks:load ready', function(){
    $('#tags-modal').on('shown.bs.modal', function () {
        $('#new_tag').enableClientSideValidations();
    })
});