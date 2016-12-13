//bootsy settings are in Initializers



$(document).on('turbolinks:load ready', function(){
    var youtube_video_list = $('.youtube-video-list');
    var youtube_video_modal = $('#youtube-videos')
    var new_review = $('#new_review')

    $('#review-modal').on('shown.bs.modal', function () {
        new_review.resetClientSideValidations();
        new_review.enableClientSideValidations();
    })

    youtube_video_modal.on('show.bs.modal', function(){
        $.ajax({
            url: '/reviewer/reviews/youtube_videos',
            dataType: 'json',
            method: 'GET',
            beforeSend: function() {
                youtube_video_list.html('<h3 class="text-center text-primary">Loading YouTube Videos ...</h3>');
            },
            success: function (data) {
                youtube_video_list.empty().append('<div class="form-group"><label for="filter">Filter Results:</label><input type="text" class="form-control" id="filter"></div>');
                youtube_video_list.append("<ul class='list-group'")
                for(var i = 0; i < data.youtube_videos.length; i++)
                {
                    youtube_video_list.append("<a href='#' class='list-group-item titles' data-id='"+ data.youtube_videos[i].id +"'><span class='badge'>Add</span>"+ data.youtube_videos[i].title +"</a>");
                }
                youtube_video_list.append('</ul>');
                live_search();
                youtube_list_click();
            },
            timeout: 15000,
            error: function(jqXHR, textStatus, errorThrown) {
                if(textStatus==="timeout") {
                    youtube_video_list.empty().append('<h3 class="text-center text-danger well-lg">There was a timeout error.' +
                        'Please check your internet connection or try again'+'</h3>');

                }
                else
                {
                    youtube_video_list.empty().append('<h3 class="text-center text-danger well-lg">Looks like your access permissions connecting Vivieu to YouTube expired. ' +
                        'Use the button below to ask YouTube for access permissions'+'</h3><br><div class="text-center"><a href="/users/auth/google_oauth2?prompt=consent&origin='+ window.location.href +'" class="btn btn-default btn-lg medium-text">Authenticate from YouTube <i class="fa fa-youtube-square" aria-hidden="true"></i></a></div>');
                }
            }
        });
    });
});

function live_search(){
    console.log('live search called');
    $("#filter").keyup(function(){

        // Retrieve the input field text and reset the count to zero
        var filter = $(this).val(), count = 0;
        // Loop through the comment list
        $('.titles').each(function(){
            // If the list item does not contain the text phrase fade it out
            if ($(this).text().search(new RegExp(filter, "i")) < 0) {
                $(this).fadeOut();

                // Show the list item if the phrase matches and increase the count by 1
            } else {
                $(this).show();
                count++;
            }
        });

        // Update the count
        var numberItems = count;
        $("#filter-count").text("Number of Comments = "+count);
    });
}

function youtube_list_click()
{

    $('.titles').on('click', function(e){
        e.preventDefault()
        $('#review_youtube_id').val($(this).data('id'))
        replace_with_video($(this).data('id'));
        $('#youtube-videos').modal('hide')

    });
}

function replace_with_video(youtube_id){
    $('.youtube-view').fadeOut(300, function() {
        $(this).html("<iframe id='ytplayer' type='text/html' width='600' height='400'" +
            " src='https://www.youtube.com/embed/"+ youtube_id +"' +frameborder='0'>" +
            "</iframe><button type='button' class='btn btn-primary btn-sm' data-toggle='modal' data-target='#youtube-videos'>" +
            "Use another video </button>").fadeIn(500)
    })
}


function initialize_edit_review(review_id, tag_id){
    var $review_tags = $('#review_tags');
    var saved_animation = $(".form-saved-animation");

    //Call populate tags on initialization
    populate_tags(tag_id);

    //token field methods
    //Visit - https://github.com/sliptree/bootstrap-tokenfield
    //--------------------------------------------------------------------------------------------
    $review_tags.on('tokenfield:createtoken', function (event) {
        var existingTokens = $(this).tokenfield('getTokens');
        $.each(existingTokens, function(index, token) {
            if (token.value === event.attrs.value)
                event.preventDefault();
        });
    });
    //--------------------------------------------------------------------------------------------

    //Helps save a review after typing and clicking
    //--------------------------------------------------------------------------------------------
    var typingTimer;                //timer identifier
    var doneTypingInterval = 3000;  //time in ms, 5 second for example
    var doneMouseInterval = 2000;
    var $input = $(':input');


    $review_tags.on('tokenfield:createdtoken tokenfield:removedtoken', function(){
        clearTimeout(typingTimer);
        typingTimer = setTimeout(doneTyping, doneMouseInterval);
    })

    $input.on('keyup', function () {
        clearTimeout(typingTimer);
        typingTimer = setTimeout(doneTyping, doneTypingInterval);
    });

    //on keydown, clear the countdown
    $input.on('keydown', function () {
        clearTimeout(typingTimer);
    });

    //user is "finished typing," do something
    function doneTyping () {
        submit_edit_form(review_id);
    }
    //--------------------------------------------------------------------------------------------

    //Populate tags in #review_tags
    //--------------------------------------------------------------------------------------------
    function populate_tags(tag_id){
        $.ajax({
            method: 'GET',
            data: tag_id,
            url: '/reviewer/tags/json_tags.json?id='+ tag_id,
            success: function(data){
                var tag_array = [];
                for(var i = 0; i < data.length; i++)
                {
                    tag_array.push(data[i].title)
                }

                $review_tags.tokenfield({
                    autocomplete: {
                        source: tag_array,
                        delay: 100
                    },
                    showAutocompleteOnFocus: false
                });
            }
        });
    }
    //--------------------------------------------------------------------------------------------

    //Submits form using Ajax
    //--------------------------------------------------------------------------------------------
    function submit_edit_form(review_id) {
        var form_info = '#edit_review_' + review_id;
        form_info = $(form_info);
        $.ajax({
            url: '/reviewer/reviews/'+review_id,
            type: 'PATCH',
            dataType: 'json',
            data: form_info.serialize(),
            success: function (data) {
                saved_animation.show();
                setTimeout(function() {
                    saved_animation.fadeOut(1000); }, 2000);
            },
            error: function (xhr, err) {
                console.log(xhr.responseText);
            },
        });
        return false;
    }
    //--------------------------------------------------------------------------------------------
}
