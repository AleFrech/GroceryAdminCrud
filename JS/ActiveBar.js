/**
 * Created by afrech on 1/30/17.
 */
$(document).ready(function () {
    var pathname = window.location.pathname;
    $('.nav > li > a[href="'+pathname+'"]').parent().addClass('active');
});