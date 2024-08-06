const slider = document.querySelector('.make-slider-parent .make-slider');
const navSlider = document.querySelector('.ls-nav-slider .slider-body .nav-track');
if(slider){
    let mouseDown = false;
    let startX, scrollLeft;
    let startDragging = function (e) {
        mouseDown = true;
        startX = e.pageX - slider.offsetLeft;
        scrollLeft = slider.scrollLeft;
    };

    let stopDragging = function (event) {
        mouseDown = false;
    };
    
    if(slider && slider.length > 0){

        slider.addEventListener('mousemove', (e) => {
            e.preventDefault();
            if(!mouseDown) { return; }
            const x = e.pageX - slider.offsetLeft;
            const scroll = x - startX;
            slider.scrollLeft = scrollLeft - scroll;
        });
    }

    const sliderParent = document.querySelector('.make-slider-parent');


    // daynamic dragging
    let startDraggingD = function (e) { 
        e.preventDefault();
        //console.log('start dragging');
        let cElem;
        mouseDown = true;
        if(hasClass(e.target, 'make-slider')){
            cElem = e.target;
        }else{
            cElem = e.target.closest('.make-slider');
            //console.log(e.pageX + ' ' +cElem.offsetLeft);
        }

        if(cElem){
            
            startX = e.pageX - cElem.offsetLeft;
            scrollLeft = cElem.scrollLeft;
        }

        //console.log(cElem.offsetLeft);
    };

    let startMoving = function (e) {
        let cElem;
        e.preventDefault();
        if(!mouseDown) { return; }

        if(hasClass(e.target, 'make-slider')){
            cElem = e.target;
        }else{
            cElem = e.target.closest('.make-slider');
            //console.log(e.pageX + ' ' +cElem.offsetLeft);
        }

        if(cElem){

            //console.log(cElem.offsetLeft);

            const x = e.pageX - cElem.offsetLeft;
            const scroll = x - startX;
            cElem.scrollLeft = scrollLeft - scroll;
        }

        //console.log('mouse moved');
    };


    if(document.getElementsByClassName("make-slider-parent").length > 0){
        // console.log(document.getElementsByClassName("make-slider-parent").length);
        var sliderP =  document.getElementsByClassName("make-slider-parent");
        for (var i = 0; i < sliderP.length; i++) {
            let elem =  sliderP.item(i).querySelector('.make-slider');
        

            elem.addEventListener('mousedown', startDraggingD, false);
            elem.addEventListener('mousemove', startMoving, false);
            elem.addEventListener('mouseup', stopDragging, false);
            elem.addEventListener('mouseleave', stopDragging, false);
        }
    }


    slider.addEventListener('mousedown', startDragging, false);
    slider.addEventListener('mouseup', stopDragging, false);
    slider.addEventListener('mouseleave', stopDragging, false);

    function hasClass(element, className) {
        return (' ' + element.className + ' ').indexOf(' ' + className+ ' ') > -1;
    }
}


/**
 * 
 * NAV SLIDER
 * 
*/
if(navSlider){
    let mouseDown = false;
    let startX, scrollLeft;
    let startDragging = function (e) {
        mouseDown = true;
        startX = e.pageX - navSlider.offsetLeft;
        scrollLeft = navSlider.scrollLeft;
    };

    let stopDragging = function (event) {
        mouseDown = false;
    };
    
    if(navSlider && navSlider.length > 0){

        navSlider.addEventListener('mousemove', (e) => {
            e.preventDefault();
            if(!mouseDown) { return; }
            const x = e.pageX - navSlider.offsetLeft;
            const scroll = x - startX;
            navSlider.scrollLeft = scrollLeft - scroll;
        });
    }

    // daynamic dragging
    let startDraggingD = function (e) { 
        e.preventDefault();
        //console.log('start dragging');
        let cElem;
        mouseDown = true;
        if(hasClass(e.target, 'nav-track')){
            cElem = e.target;
        }else{
            cElem = e.target.closest('.nav-track');
            //console.log(e.pageX + ' ' +cElem.offsetLeft);
        }

        if(cElem){
            
            startX = e.pageX - cElem.offsetLeft;
            scrollLeft = cElem.scrollLeft;
        }

        //console.log(cElem.offsetLeft);
    };

    let startMoving = function (e) {
        let cElem;
        e.preventDefault();
        if(!mouseDown) { return; }

        if(hasClass(e.target, 'nav-track')){
            cElem = e.target;
        }else{
            cElem = e.target.closest('.nav-track');
            //console.log(e.pageX + ' ' +cElem.offsetLeft);
        }

        if(cElem){

            //console.log(cElem.offsetLeft);

            const x = e.pageX - cElem.offsetLeft;
            const scroll = x - startX;
            cElem.scrollLeft = scrollLeft - scroll;
        }

        //console.log('mouse moved');
    };


    if(document.getElementsByClassName("ls-nav-slider").length > 0){
        // console.log(document.getElementsByClassName("make-slider-parent").length);
        var sliderP =  document.getElementsByClassName("ls-nav-slider");
        for (var i = 0; i < sliderP.length; i++) {
            let elem =  sliderP.item(i).querySelector('.nav-track');
        

            elem.addEventListener('mousedown', startDraggingD, false);
            elem.addEventListener('mousemove', startMoving, false);
            elem.addEventListener('mouseup', stopDragging, false);
            elem.addEventListener('mouseleave', stopDragging, false);
        }
    }


    navSlider.addEventListener('mousedown', startDragging, false);
    navSlider.addEventListener('mouseup', stopDragging, false);
    navSlider.addEventListener('mouseleave', stopDragging, false); 

    function hasClass(element, className) {
        return (' ' + element.className + ' ').indexOf(' ' + className+ ' ') > -1; 
    } 
}

