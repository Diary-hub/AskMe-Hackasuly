$(document).ready(function () {
    $('#menu').click(function () {
        $(this).toggleClass('fa-times');
        $('.side_page').toggleClass('toggle');
    });




    $(window).on('scroll load', function () {

        $('#menu').removeClass('fa-times');
        $('.side_page').removeClass('toggle');

    });

});





$(document).ready(function () {
    $('#action_menu_btn').click(function () {
        $('.action_menu').toggle();
    });
});



