$(document).on('page:change ready', function(){
    $('#review-modal').on('shown.bs.modal', function () {
        $('#new_review').enableClientSideValidations();
    })
});