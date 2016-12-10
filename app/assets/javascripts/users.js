function initialize_user_preview()
{

    var user_description_preview = $('#user-description-preview');
    var user_description = $('#user_description')
    hide_description_box();

    function hide_description_box()
    {
        if(user_description.val() == "")
        {
            user_description_preview.hide();
        }
    }

    user_description.keyup(function(event){
        user_description_preview.show();
        user_description_preview.text($(this).val());
        hide_description_box();
    });


    $('#user_vivieu_name').keyup(function(){
        if($('#user_vivieu_name').val() == '')
        {
            $('#vivieu-name-preview').text('Vivieu display name cannot be blank');
        }
        else {
            $('#vivieu-name-preview').text($(this).val());
        }
    })

    $('#user_facebook').keyup(function(){
        if($('#user_facebook').val() == ''){
            $('#fb-icon').hide();
        }
        else {
            $('#fb-icon').show();
        }
    });

    $('#user_twitter').keyup(function(){
        if($('#user_twitter').val() == ''){
            $('#twitter-icon').hide();
        }
        else {
            $('#twitter-icon').show();
        }
    });

    $('#user_google_plus').keyup(function(){
        if($('#user_google_plus').val() == ''){
            $('#g-icon').hide();
        }
        else {
            $('#g-icon').show();
        }
    })

    $('#user_patreon').keyup(function(){
        if($('#user_patreon').val() == ''){
            $('#patreon-icon').hide();
        }
        else {
            $('#patreon-icon').show();
        }
    })

    $('#user_personal_website').keyup(function(){
        if($('#user_personal_website').val() == ''){
            $('#personal-website-preview').hide();
        }
        else {
            $('#personal-website-preview').show();
        }
    })




}