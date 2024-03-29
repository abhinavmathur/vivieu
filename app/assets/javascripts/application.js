// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery-ui/widgets/autocomplete
//= require ahoy
//= require bootstrap-sprockets
//= require jquery_ujs
//= require rails.validations
//= require rails.validations.simple_form
//= require cocoon
//= require data-confirm-modal
//= require bootstrap-tagsinput
//= require twitter/typeahead.min
//= require bootsy
//= require_tree .



//bootsy settings are in Initializers
//Global Javascript Settings Go Here

dataConfirmModal.setDefaults({
    title: 'Confirm your action',
    commit: 'Continue',
    cancel: 'Cancel'
});
