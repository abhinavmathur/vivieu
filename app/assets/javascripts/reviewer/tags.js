function populate_tags(){
    var tags_array = $('#tag-field').val().split(',');
    var html_array = []
    for(var i = 0; i < tags_array.length; i++)
    {
        html_array.push('<p class="text-center lead"><span>' +(i + 1)+ ') </span>' + tags_array[i] + '</p><br>');
    }
    $('.tag-display').html(html_array.join(''));
}


