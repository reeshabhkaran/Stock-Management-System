var Site = function () {
   var sidebarSubMenuToggle = function () {
        jQuery('.page-sidebar').on('click', 'li > a', function (e) {
            var parent = $(this).parent().parent();
            var the = $(this);
            var menu = $('.page-sidebar-menu');
            var sub = jQuery(this).next();
            
            parent.children('li.open').children('.sub-menu').slideUp(450);
            parent.children('li.open').removeClass('open');
            if (sub.is(":visible")) {
                jQuery( jQuery(this)).removeClass("open");
                jQuery(this).parent().removeClass("open");
                sub.slideUp(450);
            } else {
                jQuery( jQuery(this)).addClass("open");
                jQuery(this).parent().addClass("open");
                sub.slideDown(450);
            }
        });
    }

    var sidebarToggle = function () {
        var body = $('body');              
        $('.page-sidebar, .page-header').on('click', '.sidebar-toggler', function (e) {
            var sidebar = $('.page-sidebar');
            var sidebarMenu = $('.page-sidebar-menu');        

            if (body.hasClass("page-sidebar-closed")) {
                body.removeClass("page-sidebar-closed");
                sidebarMenu.removeClass("page-sidebar-menu-closed");              
            } else {
                body.addClass("page-sidebar-closed");
                sidebarMenu.addClass("page-sidebar-menu-closed");                           
            }
        });     
    }
    
    
    return {

        
        init: function () {
            sidebarSubMenuToggle();
            sidebarToggle();     
        },
     
     
        // To get the correct viewport width based on  http://andylangton.co.uk/articles/javascript/get-viewport-size-javascript/
        getViewPort: function () {
            var e = window, a = 'inner';
            if (!('innerWidth' in window)) {
                a = 'client';
                e = document.documentElement || document.body;
            }
            return {
                width: e[a + 'Width'],
                height: e[a + 'Height']
            }
        }

    };

} ();