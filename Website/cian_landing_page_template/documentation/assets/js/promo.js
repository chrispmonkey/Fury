(function() {
    'use strict';
    return;

    var script = $('<script></script>');
    var style = $('<link rel="stylesheet" href="http://premiothemes.com/promo/css/owl.carousel.css">');
    var wrapper = $('<div class="premio-promo"><div id="premioPromoWrapper"></div></div>').insertBefore('.navbar-footer');

    script.on('load', function() {
        console.log('aaa');
        $('#premioPromoWrapper').owlCarousel({
            jsonPath : 'http://premiothemes.com/promo/promo.json',
            jsonSuccess : function(data) {
                console.log('bbb');
                var content = "";
                console.log(data["categories"][1]["items"])
                for(var i in data["categories"][1]["items"]){
                    var thumb = data["categories"][1]["items"][i].thumb;
                    var alt = data["categories"][1]["items"][i].alt;

                    content += '<div class="item"><img src="' +data.path + thumb+ '" alt="' +alt+ '"></div>';
                }
                $('#premioPromoWrapper').html(content);
            },
            //lazyLoad : true,
            navigation : true,
            pagination : true
        });
    });

    script.appendTo('body').attr('src', 'http://premiothemes.com/promo/js/owl.carousel.min.js');
    style.appendTo('body');

}());