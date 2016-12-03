//bootsy settings are in Initializers

$(document).on('page:change ready', function(){
    var youtube_video_list = $('.youtube-video-list');
    var youtube_video_modal = $('#youtube-videos')

    $('#review-modal').on('shown.bs.modal', function () {
        $('#new_review').enableClientSideValidations();
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
                        'Use the button below to ask YouTube for access permissions'+'</h3><br><div class="text-center"><a href="/users/auth/google_oauth2?prompt=consent" class="btn btn-default btn-lg medium-text">Authenticate from YouTube <i class="fa fa-youtube-square" aria-hidden="true"></i></a></div>');
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