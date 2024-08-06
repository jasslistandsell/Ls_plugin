$(document).ready(function(){
    $('.ls-search-slider').slick({ 
        slidesToShow: 1,
        slidesToScroll: 1,
        autoplay: $(this).hasClass("autoplay"),
        autoplaySpeed: 1000,
        speed:500, 
        arrows: true,
        dots: $(this).hasClass("dots"),
        fade:true,
        lazyLoad: 'ondemand',
        pauseOnHover: false,
        prevArrow: $('.prev'),
        nextArrow: $('.next'),
        appendDots:"#mainSlider__dots1"
    });
    jQuery('.ls-cat-slider').slick({
        dots: false,
        arrows:true,
        infinite: true,
        speed: 300,
        slidesToShow: 6,
        slidesToScroll: 1,
        adaptiveHeight: true,
        responsive: [
        {
        breakpoint: 1200,
        settings: {
            slidesToShow: 3,
            slidesToScroll: 3,
            infinite: true
        }
        },
        {
        breakpoint: 600,
        settings: {
            slidesToShow: 2,
            slidesToScroll: 2
        }
        }
    ]
        
    });

    $(document).on('beforeChange', '.ls-search-outer .ls-search-slider', function(event, slick, currentSlide, nextSlide){
        var elem = $(this);
        var color = elem.find('div[data-slick-index='+nextSlide+']').attr('backcolor');
        if(!color){
            color = elem.find('div[data-slick-index='+nextSlide+'] [backcolor]').attr('backcolor');
        }
        elem.closest('.ls-search-outer').css({backgroundColor:color});
    });


    // $('.make-slider').slick({ 
    //     slidesToShow: 4,
    //     slidesToScroll: 4,
    //     autoplay: false,
    //     autoplaySpeed: 4000,
    //     speed:1000,
    //     arrows: true,
    //     dots: true,
    //     fade:false, 
    //     pauseOnHover: false,
    //     prevArrow: '<span class="prev"></span>',
    //     nextArrow: '<span class="next"></span>', 
    // });


    if($(document).find('.make-slider').length > 0){
        $(document).find('.make-slider').each(function(e) {
            let elem = $(this);
            let pElem = elem.closest('.make-slider-parent').length > 0 ? elem.closest('.make-slider-parent') : null;

            if(pElem){
                let minItemWidth = elem.attr('minelemwidth') ? parseInt(elem.attr('minelemwidth')) : 250;
                // console.log(minItemWidth);
                let pWidth = parseInt(pElem.width());
                let boxWidth = (pWidth / 4);
                let minWidth = minItemWidth; 
                let elemCount =  pElem.find('.col-slider').length;
                if(boxWidth < minWidth){
                    boxWidth = minWidth;
                }

                if(elem.closest(".make-slider-parent").hasClass("small")){
                    elem.find('.col-slider').css({width:'auto', minWidth:minWidth+'px'});
                }else{
                    elem.find('.col-slider').css({width:minWidth+'px', minWidth:minWidth+'px'});
                }
                // console.log(boxWidth); 
                var count = 1;

                elem.find('.col-slider').each(function(e){
                    $(this).addClass('slide-'+count); 
                    count++;
                });
                // setTimeout(function() {                  
                //     if($(elem).hasScrollBar('horizontal', 5)){
                //         $(this).closest(".make-slider-parent").removeClass("no-scroll");
                //     }else{
                //         $(this).closest(".make-slider-parent").addClass("no-scroll"); 
                //     }
                // }, 400);
            }
        });
    }

    $(document).on('click', '.make-slider-parent .next', function(){
        let elem = $(this);
        let pElem = elem.closest('.make-slider-parent').length > 0 ? elem.closest('.make-slider-parent') : null;
        //console.log('scroll left');
        if(pElem){
            let cSld = elem.attr('st');
            let pWidth = parseInt(pElem.width());
            let tWidth = parseInt(pElem.find('.make-slider').width());
            let boxWidth = (pWidth / 4) - 10;
            let minWidth = 300;
            let elemCount =  pElem.find('.col-slider').length;
            let elemWidth =  pElem.find('.col-slider').width();

            if(boxWidth < minWidth){
                boxWidth = minWidth;
            }
            // if((tWidth + minWidth) < scTo ){
            //     cSld = 1;
            // }else{
            //     cSld ++;
            // }

            let cScrollPos = pElem.find('.make-slider').scrollLeft();

            let sWidth = elemCount*elemWidth - tWidth;

            // console.log('SP : '+cScrollPos + '  TW: '+sWidth + ' BW: '+boxWidth + ' eW '+tWidth);
            // console.log(pElem.find('.make-slider').offsetWidth);
            let newSld = cSld;
            let scTo = parseInt(newSld)*minWidth; 
            
            // if(cSld >= (elemCount - 1) || scTo >= sWidth || cSld == elemCount){
            //     cSld = 0;
            //     newSld = 0;
            //     scTo = 0;
            // }else{
            //     cSld ++;
            // }
            if( scTo >= sWidth || cSld == elemCount){
                cSld = 0;
                newSld = 0;
            }else{
                cSld ++;
            }

            
            if(scTo == 0){
                pElem.find('.make-slider').animate({'scrollLeft': scTo}, 0);  
            }else{
                pElem.find('.make-slider').animate({'scrollLeft': scTo}, 500);  
            }

            // console.log('SP : '+cScrollPos + '| '+scTo+'  TW: '+tWidth + ' BW: '+boxWidth);

            pElem.find('.next').attr('st', cSld);
            pElem.find('.prev').attr('st', cSld); 
            //elem.attr('st', cSld);
            
        }
    });

    $(document).on('click', '.make-slider-parent .prev', function(){
        let elem = $(this);
        let pElem = elem.closest('.make-slider-parent').length > 0 ? elem.closest('.make-slider-parent') : null;
        //console.log('scroll left');
        if(pElem){
            let cSld = elem.attr('st');
            let pWidth = parseInt(pElem.width());
            let tWidth = parseInt(pElem.find('.make-slider').width());
            let boxWidth = (pWidth / 4) - 10;
            let minWidth = 300;
            let elemCount =  pElem.find('.col-slider').length;
            let elemWidth =  pElem.find('.col-slider').width();

            if(boxWidth < minWidth){
                boxWidth = minWidth;
            }

            let cScrollPos = pElem.find('.make-slider').scrollLeft();

            let sWidth = elemCount*elemWidth - tWidth;

            
            // console.log(pElem.find('.make-slider').offsetWidth);
            let newSld = cSld - 1;
            
            
            if(cSld <= 1 && cScrollPos <= 0){
                cSld = elemCount;
                newSld = elemCount;
            }else{
                cSld --;
            }

            let scTo = parseInt(newSld)*minWidth; 

            // console.log('SP : '+cScrollPos + '  TW: '+sWidth + ' BW: '+boxWidth + ' st '+scTo);
            if(scTo > cScrollPos && cSld != elemCount){
                scTo = cScrollPos - minWidth;

            }

            pElem.find('.make-slider').animate({'scrollLeft': scTo}, 500);  

            // console.log('SP : '+cScrollPos + '| '+scTo+'  TW: '+tWidth + ' BW: '+boxWidth);
            //cScrollPos = pElem.find('.make-slider').scrollLeft();
            if(scTo - minWidth <= 0){
                cSld = 1;
            }

            pElem.find('.next').attr('st', cSld);
            pElem.find('.prev').attr('st', cSld); 
            //elem.attr('st', cSld);
            
        }
    });

    /**
     * 
     * ctrl toggle
     * 
     */
    if($(document).find('.relocate-content').length > 0){
        $(document).find('.relocate-content').each(function(e){
            let cElem = $(this);
            var pWrap = $(this).attr('parentwrap');

            // For some browsers, `attr` is undefined; for others,
            // `attr` is false.  Check for both.
            if (typeof pWrap !== 'undefined' && pWrap !== false) {
                if($(document).find(pWrap).length > 0){
                    var cWrap = $(this).attr('containerwrap');
                    if (typeof cWrap !== 'undefined' && cWrap !== false) {
                        if($(document).find(cWrap).length > 0){
                            $(document).find(cWrap).html(cElem.html());
                            $(document).find(cWrap).addClass('active');
                        }
                    }
                }
                
            }
        })
    }

    $(document).on('click', '.ctrl-toggle .ctrl-btn', function(e){ 
        let elem = $(this);
        let pElem = elem.closest('.ctrl-toggle');
        let pElemWrap = pElem.closest(pElem.attr('parent-wrap')).length > 0 ? pElem.closest(pElem.attr('parent-wrap')) : false;
        pElem.find('span.fcount').remove(); 
        if(pElemWrap){
            pElem.find('.active').removeClass('active');
            elem.addClass('active');
            pElemWrap.find('.ctrl-elem').addClass('hide').removeClass('show').removeClass('anim-customfilter'); 
            if(elem.attr('ctrl') != 'all' && elem.attr('ctrl') != '' && elem.attr('ctrl') != 'reset'){
                pElemWrap.find('.ctrl-elem').addClass('hide').removeClass('show').removeClass('anim-customfilter');
                if(pElemWrap.find('.'+elem.attr('ctrl')).length > 0){
                    pElemWrap.find('.'+elem.attr('ctrl')).removeClass('hide').addClass('anim-customfilter show');
                    let count = pElemWrap.find('.'+elem.attr('ctrl')).length;
                    
                    elem.append(' <span class="fcount">('+count+')</span>');
                }
            }else{
                pElemWrap.find('.ctrl-elem').removeClass('hide').removeClass('show').removeClass('anim-customfilter');
                let count = pElemWrap.find('.ctrl-elem').length;
                elem.append(' <span class="fcount">('+count+')</span>');
            }
        }

    });

    /**
     * 
     * TOGGLE Nav Slider
     * 
     */

    toggleNavSliderBtns(); 

    function toggleNavSliderBtns(){
        if($(document).find('.ls-nav-slider').length > 0 ){
            $(document).find('.ls-nav-slider .slider-body ul').each(function(e) { 
                if($(this).hasScrollBar('horizontal', 5)){
                    $(this).closest(".ls-nav-slider").removeClass("no-scroll"); 
                    $(this).removeClass("no-scroll"); 
                }else{
                    $(this).closest(".ls-nav-slider").addClass("no-scroll"); 
                    $(this).addClass("no-scroll"); 
                }
            });
        }
    }

    $(document).on("click", ".ls-nav-slider .nextB, .ls-nav-slider .next", function(e){
        let elem = $(this);
        let slideELem = elem.closest(".ls-nav-slider, .ls-nav-slider .next").find(".slider-body > ul");
        nextNavElem(slideELem);
    });
    $(document).on("click", ".ls-nav-slider .prevB", function(e){
        let elem = $(this);
        let slideELem = elem.closest(".ls-nav-slider").find(".slider-body > ul");
        prevNavElem(slideELem);
    });

    if($(document).find('.ls-nav-slider').length > 0 ){
        // $(document).find('.ls-nav-slider .slider-body ul').each(function(e) { 
        //     var gridLeft = 0,
        //     gridRight = $(this).outerWidth();
        //     console.log(gridRight);

        //     $(this).on('scroll', function() {
        //         let c = 1;
        //         console.log("ul offset left "+$(this).offset().left);
        //         console.log("ul scroll left "+$(this).scrollLeft()); 
        //         var ulElem = $(this);
        //         $(this).find("li").each(function(){ 
        //             var thisLeft = $(this).offset().left;
        //             let eWidth = $(this).width();
        //             let nS = thisLeft - ulElem.offset().left - gridRight + eWidth;
        //             let nS2 = thisLeft - ulElem.offset().left - gridRight;
        //             console.log(nS2+" | "+nS+" : "+c+" : "+thisLeft +" || "+ $(this).width()+ " || "+ gridRight);
        //             c++;
        //         });
        //     })
        // });
    }
    

    // Scroll next
    function nextNavElem(slideELem){ 
        let ulElem = slideELem;
        var gridLeft = 0,
        gridRight = ulElem.outerWidth();
        // console.log(gridRight);
        let c = 1;
        ulElem.find("li").each(function(){ 
            var thisLeft = $(this).offset().left;
            let eWidth = $(this).width();
            // console.log(c);
            // console.log(ulElem.scrollLeft() +thisLeft - gridRight );
            // console.log("---------------------");
            if(thisLeft - gridRight < eWidth){
                let nS = thisLeft - ulElem.offset().left - gridRight + eWidth;
                let nS2 = thisLeft - ulElem.offset().left - gridRight;
                // console.log(ulElem.scrollLeft() + $(this).width());
                let newOff = gridRight + nS; 
                // console.log("click: "+ c+" : "+thisLeft + " | " +$(this).width() +" | "+ gridRight);
                ulElem.animate({
                    scrollLeft : ulElem.scrollLeft() + $(this).width()
                })
                c++;
                return false;
            }
        });
    }

     // Scroll Prev
    function prevNavElem(slideELem){  
        let ulElem = slideELem;
        var gridLeft = 0,
        gridRight = ulElem.outerWidth();
        let ulScrollLeft = ulElem.scrollLeft();
        // console.log(gridRight);
        let c = 1;
        if(ulScrollLeft > 0){
            let tempElem;
            let tempNs = 0;
            ulElem.find("li").each(function(){ 
                var thisLeft= $(this).offset().left;
                let eWidth = $(this).width();
                let nS = thisLeft - ulElem.offset().left - gridRight;
                // console.log(c + " | "+nS);
                // console.log(c + " | "+ (gridRight + nS));

                // console.log("----------- "+c+" -------------");
                // console.log(Math.abs(nS) +" - "+ gridRight +" < "+ eWidth);

                if( Math.abs(nS) - gridRight > 0 && Math.abs(nS) - gridRight < eWidth) {
                    ulElem.animate({
                        scrollLeft : ulElem.scrollLeft() - (Math.abs(nS) - gridRight)   
                    })
                    c++;
                    return false; 
                }
            });
        }
    }


     toggleShowMoreBtn(); 
     $( window ).resize(function() {
        //console.log("abc");
        toggleShowMoreBtn(); 
        toggleNavSliderBtns();

        // if($(document).find('.make-slider').length > 0){
        //     $(document).find('.make-slider').each(function(e) {
        //         if($(this).hasScrollBar('horizontal', 5)){
        //             $(this).closest(".make-slider-parent").removeClass("no-scroll");
        //         }else{
        //             $(this).closest(".make-slider-parent").addClass("no-scroll");
        //         }
        //     });
        // }
        
        
    });

    function toggleShowMoreBtn(){
        if($(document).find('.toggle-height').length > 0){
            $(document).find('.toggle-height').each(function(e) {
                let elem = $(this);
                let maxHeight = elem.attr('maxheight') ? parseInt(elem.attr('maxheight')) : 0;
    
                if(maxHeight > 0){
                    // elem.find('.toggle-content').css({maxHeight:maxHeight+'px'});
                    if($(elem).find('.toggle-height-child').length > 0){
                        let realHeight = parseInt($(elem).find('.toggle-height-child').height());
                        if(maxHeight < realHeight){
                            elem.find('.toggle-btn-wrap').addClass('show');
                            elem.find('.toggle-btn-wrap').removeClass('hide');
                        }else{
                            elem.find('.toggle-btn-wrap').addClass('hide');
                            elem.find('.toggle-btn-wrap').removeClass('show');
                        }
                    }
                }
                
            })
        }
    }


    $(document).on('click', '.toggle-height .toggle-btn-wrap .btn-text', function(e) {
        let elem = $(this);
        
        let pElem = elem.closest('.toggle-height').length > 0 ? elem.closest('.toggle-height') : null ;

        if(pElem && pElem.hasClass('show')){
            pElem.removeClass('show');
        }else{
            pElem.addClass('show');
        }
        
    });

    $(document).on('focus','.ls-search-local', function(e){
        var elem = $(this);
        var pElem = elem.closest('.container');

        if(pElem.length > 0 && pElem.find('.toggle-height').length > 0){
            pElem.find('.toggle-height').addClass('show');
            pElem.find('.show-more-btn').addClass('hide');
        }
	});
    $(document).on('focusout','.ls-search-local', function(e){
        var elem = $(this);
        var pElem = elem.closest('.container');

        if($.trim(elem.val()) == ''){
            if(pElem.length > 0 && pElem.find('.toggle-height').length > 0){
                pElem.find('.toggle-height').removeClass('show');
                pElem.find('.show-more-btn').removeClass('hide');
            }
        }
	});

});

/**
 * 
 * UTIL FUNCTIONS
 * 
 */
(function ($) {
    /**
     * 
     * CHECK IF HAS HORIZONTAL SCROLLBAR
     * 
     */
    $.fn.hasScrollBar = function(direction, offset = 0)
    {
        if (direction == 'vertical')
        {
            return this.get(0).scrollHeight > this.innerHeight() + offset;
        }
        else if (direction == 'horizontal')
        {
            // console.log(this.get(0).scrollWidth + " "+this.innerWidth());
            return this.get(0).scrollWidth > this.innerWidth() + offset;
        }
        return false;
    }

}(jQuery));

/***form data  */
var currentStep = 1;

function showStep(stepNumber) {
  document.getElementById('step1').style.display = 'none';
  document.getElementById('step2').style.display = 'none';
  document.getElementById('prevBtn').style.display = 'none';
  document.getElementById('nextBtn').style.display = 'none';
  
  document.getElementById('step' + stepNumber).style.display = 'block';
  
  if (stepNumber > 1) {
    document.getElementById('prevBtn').style.display = 'inline';
  }
  
  if (stepNumber < 2) {
    document.getElementById('nextBtn').style.display = 'inline';
  }
  
  currentStep = stepNumber;
}

function nextStep() {
  if (currentStep < 2) {
    showStep(currentStep + 1);
  }
}

function prevStep() {
  if (currentStep > 1) {
    showStep(currentStep - 1);
  }
}
