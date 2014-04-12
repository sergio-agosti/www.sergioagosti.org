(function ($) {
    $.fn.screenshot = function(options) {  
        var settings = $.extend({}, options);

        return this.each(function() {
            var $this = $(this),
                $img = $this.find('> img');
            
            $this.on('click.screenshot', function (event) {
                event.preventDefault();
                $this.toggleClass('is-target');
            });
        });
    };
    
    $('.gallery__image').screenshot();
})(jQuery);