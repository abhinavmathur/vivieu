$(document).on('ready turbolinks:load', function() {
    $('select[name=order-select]').change(function(e)
    {
        if($('select[name=order-select]').val() == 'title-desc')
        {
            window.location.assign('/reviewer/categories?order=title-desc');
        }
        else if($('select[name=order-select]').val() == 'title-asc')
        {
            window.location.assign('/reviewer/categories?order=title-asc');
        }
        else if($('select[name=order-select]').val() == 'tag-asc')
        {
            window.location.assign('/reviewer/categories?order=tag-asc');
        }
        else if($('select[name=order-select]').val() == 'tag-desc')
        {
            window.location.assign('/reviewer/categories?order=tag-desc');
        }
        else if($('select[name=order-select]').val() == 'pop-asc')
        {
            window.location.assign('/reviewer/categories?order=pop-asc');
        }
        else if($('select[name=order-select]').val() == 'pop-desc')
        {
            window.location.assign('/reviewer/categories?order=pop-desc');
        }
    });
});
