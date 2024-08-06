window.addEventListener('load', function () {
    //console.log('bar.js!');
});


$(document).ready(function(){
    var shopIoUrl = 'https://sparsando.de/io.php';
    $(document).on('click', '.ls-search-wrap  span.cat-item', callAjax);
    $(document).on('click', '.ls-search-wrap .dd-cat-btn', redirectCustomPage);
    $(document).on('click', '.ls-search-wrap .dd-submit', submitDdsForm);
    $(document).on('mousedown', '.ls-search-wrap .dd-submit', submitDdsForm2); 
    $(document).on('click', '.artikel-anfrage-btn', artikelAnfrageForm);
    $(document).on('click', '.product-general-frage', generalAnfrageForm);
    $(document).on('click', '.submit-prod-anfrage-form', sendProdAnfrageEmail); 
    $(document).on('click', '.open-general-popup', openGeneralPopup);
    
    //$(document).on('click', '.form-basket .basket-details-add-to-cart', updateCartItems); 
    // $(document).on('keyup', '.search-wrapper form #search-header, .search-wrapper form #search-header-mobile-top', ajaxSearchProducts);
    
    /**
     * 
     * LS Search suggestions 
     * 
    */
   // ls search suggestion
   $(document).on('click', 'form.activesuggestion .form-clear', removeSuggestionContainer);       

//    $(document).on('focus', 'input[name="qs"].tt-input', lsSearchSuggestionToggle);  

    var typingTimer;
    var doneTypingInterval = 500;   
    var $input = $("input[name='qs'].tt-input");

    $input.on('keyup', function () {
        clearTimeout(typingTimer);
        // typingTimer = setTimeout(lsSearchSuggestions, doneTypingInterval); 
    });

    $input.on('keydown', function () {
        clearTimeout(typingTimer);
    });


    function lsSearchSuggestionToggle(e){ 
        var elem = $(this);
        // elem = $input; 
        var pElem =  elem.closest('form');
        $('html').addClass('disablescroll');
        if(e.type == "focusin"){
            // addSuggestionContainer(); 
            // lsSearchSuggestions();
        }else{
            $('html').removeClass('disablescroll');   
            pElem.removeClass('activesuggestion'); 
            pElem.find('.ls-suggestion').remove();      
        }
    }

    var searchHereText = '<div class="left-sec-wrap arrow-right"   align-items: center;"><span class="sec-text">suchen Sie hier </span> <span class="arrow-icon"><i class="fas fa-arrow-right"></i></span></div>';
    function addSuggestionContainer(){
        var elem = $input; 
        var pElem =  elem.closest('form');
        pElem.addClass('activesuggestion');
        if(pElem.find('.ls-suggestion').length <= 0){ 
            pElem.append(''
            +'<div class="ls-suggestion">'
            +'<div class="ls-suggestion-wrap">'
            +   '<div class="sg-content-wrap">'
            +       '<div class="sg-sec-wrap" >'
            +           '<div class="prod-sg sg-sec">' 
            +               '<div class="prod-sg-title sg-title"><span class="label">Suchergebnisse für Produkte</span></div>'
            +               '<div class="prod-sg-content sg-content custom-scroll">'
            +                   '<div class="content-wrap"></div>'
            +               '</div>'  
            +           '</div>'
            +       '</div>'
            +       '<div class="sg-sec-wrap" >'
            +           '<div class="cat-sg sg-sec">' 
            +               '<div class="cat-sg-title sg-title"><span class="label">Suchergebnisse für Kategorien</span></div>'
            +               '<div class="cat-sg-content sg-content custom-scroll">'
            +                   '<div class="content-wrap"></div>'
            +               '</div>' 
            +           '</div>'
            +       '</div>'
            +   '</div>'
             +       '<div class="sg-links-wrap">'
            +           '<div class="sg-links-sec">'
            +               '<span class="sec-title sm">nicht gefunden?</span> <br><a href="https://sps.shop-template.de/tinten-and-toner-finden" class="btn-link" alt="Tinte &amp; Toner finden" title="Tinte &amp; Toner finden"> <span class="text">Tinte &amp; Toner Finden</span></a>'
            +           '</div>'
            +           '<div class="sg-links-sec">'
            +               '<span class="sec-title sm">Anrufen:</span><br> <a href="tel:+493023543969">+49 30 2354 3969</a><br>'
            +               '<span class="sec-title sm">Email:</span><br> <a href="mailto:info@sparsando.de">info@sparsando.de</a><br>'  
            +           '</div>'
            +       '</div>'
            + '</div>'
            + '</div>');   
        }
    }

    function removeSuggestionContainer(){
        var elem = $input;
        var pElem =  elem.closest('form');
        $('html').removeClass('disablescroll');   
        pElem.removeClass('activesuggestion'); 
        pElem.find('.ls-suggestion').remove();  
    }

    $(document).on("mouseup", function(e){
        var container = $(".search-wrapper");
        if (!container.is(e.target) && container.has(e.target).length === 0) {
            // removeSuggestionContainer(); 
        }
    })

    function lsSearchSuggestions(e){
        var elem = $(this);
        elem = $input;
        var inputWrap  = elem.closest('form').find('.form-icon');
        if(inputWrap.find('.arrow-right').length <= 0){
            inputWrap.prepend(searchHereText);
        }
        var sgWrap  = elem.closest('form').find('.ls-suggestion');
        var prodElem  = elem.closest('form').find('.ls-suggestion .prod-sg-content');
        var catElem  = elem.closest('form').find('.ls-suggestion .cat-sg-content');

        prodElem.closest('.sg-sec-wrap').addClass('is-loading');
        catElem.closest('.sg-sec-wrap').addClass('is-loading');   
        
        var currentRequest = null;  
        if(elem.val().length > 0){
            // addSuggestionContainer();
            let cVal = elem.val();
            var currentRequest = $.ajax({
                type: 'POST',
                url: shopIoUrl,
                beforeSend : function()    {           
                    if(currentRequest != null) {
                        console.log(currentRequest);
                        currentRequest.abort();
                        console.log(currentRequest);
                    }
                }, 
                data: {
                    'io': JSON.stringify(
                        {
                            'name': 'lsGetSearchSuggestions',
                            'params': [{'type':'suggestion', 'key':cVal}]  
                        }
                    ),
                }
            }).done(function (data) {
                prodElem.find('.content-wrap').empty();  
                catElem.find('.content-wrap').empty();  
                if(data.prodsJSON){
                    sgWrap.addClass('has-data');
                    catElem.find('.content-wrap').append(jQuery.parseJSON(data.katsJSON));   
                    prodElem.find('.content-wrap').append(jQuery.parseJSON(data.prodsJSON));    
                    prodElem.closest('.sg-sec-wrap').removeClass('is-loading');
                    catElem.closest('.sg-sec-wrap').removeClass('is-loading');  
                }else{
                    sgWrap.removeClass('has-data');
                   prodElem.find('.content-wrap').empty();  
                   catElem.find('.content-wrap').empty();  
                   prodElem.closest('.sg-sec-wrap').removeClass('is-loading');
                   catElem.closest('.sg-sec-wrap').removeClass('is-loading');  
                }

            }).fail(function(jqXHR,textStatus){  
                prodElem.closest('.sg-sec-wrap').removeClass('is-loading');
                catElem.closest('.sg-sec-wrap').removeClass('is-loading');  
            });
        }else{
            if(prodElem.find('.content-wrap .rcontent.default').length > 0){
                prodElem.closest('.sg-sec-wrap').removeClass('is-loading');
                catElem.closest('.sg-sec-wrap').removeClass('is-loading'); 
            }else{
                sgWrap.removeClass('has-data');
                prodElem.find('.content-wrap').empty();  
                catElem.find('.content-wrap').empty();  

                // removeSuggestionContainer(); 
                prodElem.closest('.sg-sec-wrap').addClass('is-loading');
                catElem.closest('.sg-sec-wrap').addClass('is-loading'); 
                //---------------------------------- load default data
                $.ajax({
                    type: 'POST',
                    url: shopIoUrl,
                    beforeSend : function()    {           

                    }, 
                    data: {
                        'io': JSON.stringify(
                            {
                                'name': 'lsGetSearchSuggestions',
                                'params': [{'type':'defaultSuggestion', 'key':''}]  
                            }
                        ),
                    }
                }).done(function (data) {
                    prodElem.find('.content-wrap').empty();  
                    catElem.find('.content-wrap').empty();  
                    if(data.prodsJSON){
                        sgWrap.addClass('has-data');
                        catElem.find('.content-wrap').append(jQuery.parseJSON(data.katsJSON));   
                        prodElem.find('.content-wrap').append(jQuery.parseJSON(data.prodsJSON));    
                        prodElem.closest('.sg-sec-wrap').removeClass('is-loading');
                        catElem.closest('.sg-sec-wrap').removeClass('is-loading');  
                        sgWrap.addClass('has-data');
                        console.log(data);
                    }else{
                        sgWrap.removeClass('has-data');
                    prodElem.find('.content-wrap').empty();  
                    catElem.find('.content-wrap').empty();  
                    prodElem.closest('.sg-sec-wrap').removeClass('is-loading');
                    catElem.closest('.sg-sec-wrap').removeClass('is-loading');  
                    }

                }).fail(function(jqXHR,textStatus){  
                    prodElem.closest('.sg-sec-wrap').removeClass('is-loading');
                    catElem.closest('.sg-sec-wrap').removeClass('is-loading');  
                });
            }

            //---------------------------------- load default data ends 
        }
    }

    // GET FEED DATA
    let feedData = [];
    $('#get_feed_form').on('submit', function(event){ 
        event.preventDefault();
        let getData = true;

        if(getData){
            $.ajax({
                type: 'POST',
                url: 'https://sparsando.de/io.php',
                data: {
                    'io': JSON.stringify(
                        {
                            'name': 'lsAdminFunctions', 
                            'params': [{'type':'getfeed', 'data':""}] 
                        }
                    ),
                }
            }).done(function (data) {
                console.log(data); 
                if(data.feed){ 
                    
                    var xmlDocument = $.parseXML('<feed xmlns:vc="http://www.w3.org/2007/XMLSchema-versioning"'
                    +' xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"'
                    +' xsi:noNamespaceSchemaLocation='
                    +'"http://www.google.com/shopping/reviews/schema/product/2.3/product_reviews.xsd"/>');
                     // content
                    var version = xmlDocument.createElement('version');
                    version.appendChild(document.createTextNode("2.3"));
                    xmlDocument.documentElement.appendChild(version);

                    //aggretatore
                    var aggregator = xmlDocument.createElement('aggregator');
                    var aggregatorName = xmlDocument.createElement('name');
                    aggregatorName.appendChild(document.createTextNode("Sparsando Kundenrezension"));
                    aggregator.appendChild(aggregatorName);
                    xmlDocument.documentElement.appendChild(aggregator);
                    //publisher
                    var publisher = xmlDocument.createElement('publisher');
                    var publisherName = xmlDocument.createElement('name');
                    publisherName.appendChild(document.createTextNode("Sparsando GmbH"));
                    var favicon = xmlDocument.createElement('favicon');
                    favicon.appendChild(document.createTextNode("https://sparsando.de/templates/LSTonerTemplate/themes/base/images/favicon.ico"));
                    publisher.appendChild(publisherName);
                    publisher.appendChild(favicon);
                    xmlDocument.documentElement.appendChild(publisher);
                    
                    // reviews node
                    var reviews = xmlDocument.createElement('reviews');
                    
                    $.each( data.feed, function( key, value ) {
                        var name = value.name;
                        var productName = value.product_name;
                        var rating = value.rating;
                        var url = value.product_url;
                        var content = value.content;
                        var timestamp = value.timestamp;
                        var reviewUrl = value.review_url;
                        var skuV = value.sku;
                        var hertsteller = value.hertsteller;
                        
                        var review = xmlDocument.createElement('review');
                        // reviewer
                        var reviewer = xmlDocument.createElement('reviewer');
                        var nameE = xmlDocument.createElement('name');
                        nameE.appendChild(document.createTextNode(name));
                        reviewer.appendChild(nameE);
                        

                        //time stamp
                        var timestampE = xmlDocument.createElement('review_timestamp');
                        timestampE.appendChild(document.createTextNode(timestamp));

                        //review url stamp
                        var review_url = xmlDocument.createElement('review_url');
                        var rurl = $(review_url);
                        rurl.attr("type", "group");
                        review_url.appendChild(document.createTextNode(reviewUrl));
                        
                        // content
                        var contentE = xmlDocument.createElement('content');
                        contentE.appendChild(document.createTextNode(content)); 

                        // ratings node
                        var ratingsE = xmlDocument.createElement('ratings');
                        var rte = $(ratingsE);
                        var overall = xmlDocument.createElement('overall');
                        overall.appendChild(document.createTextNode(rating));
                        ratingsE.appendChild(overall);
                        rte.find("overall").attr("min", 1);
                        rte.find("overall").attr("max", 5);

                        // products node
                        var products = xmlDocument.createElement('products');
                        var product = xmlDocument.createElement('product');
                        var product_ids = xmlDocument.createElement('product_ids');

                        var skus = xmlDocument.createElement('skus');
                        var sku = xmlDocument.createElement('sku');
                        sku.appendChild(document.createTextNode(skuV));
                        skus.appendChild(sku);

                        var mpns = xmlDocument.createElement('mpns');
                        var mpn = xmlDocument.createElement('mpn');
                        mpn.appendChild(document.createTextNode(skuV));
                        mpns.appendChild(mpn);

                        var brands = xmlDocument.createElement('brands');
                        var brand = xmlDocument.createElement('brand');
                        brand.appendChild(document.createTextNode(hertsteller));
                        brands.appendChild(brand);

                        product_ids.appendChild(mpns);
                        product_ids.appendChild(skus);
                        product_ids.appendChild(brands);
                        
                        var product_url = xmlDocument.createElement('product_url');
                        product_url.appendChild(document.createTextNode(url));

                        var product_name = xmlDocument.createElement('product_name');
                        product_name.appendChild(document.createTextNode(productName));

                        product.appendChild(product_url);
                        product.appendChild(product_ids);
                        product.appendChild(product_name);
                        products.appendChild(product);

                        // review node
                        review.appendChild(reviewer);
                        review.appendChild(timestampE);
                        review.appendChild(contentE);
                        review.appendChild(review_url);
                        review.appendChild(ratingsE);
                        review.appendChild(products);

                        // add to root element
                        reviews.appendChild(review);
                        
                    });

                    xmlDocument.documentElement.appendChild(reviews);
                    // window.open("data:application/xml;base64," + window.btoa(xmlDocument)); 
                    // document.open('data:Application/octet-stream,' + encodeURIComponent(xmlDocument)); 
                    // const btx = window.btoa(xmlDocument); 
                    var xmlString;
                    //IE
                    if (window.ActiveXObject){
                        xmlString = xmlDocument.xml;
                    }
                    // code for Mozilla, Firefox, Opera, etc.
                    else{
                        xmlString = (new XMLSerializer()).serializeToString(xmlDocument);
                    }
                    // console.log(xml)

                    $.ajax({
                        type: 'POST',
                        url: 'https://sparsando.de/io.php',
                        data: {
                            'io': JSON.stringify(
                                {
                                    'name': 'lsAdminFunctions', 
                                    'params': [{'type':'tobase64', 'data':'<?xml version="1.0" encoding="UTF-8"?>'+xmlString}] 
                                }
                            ),
                        }
                    }).done(function (data) { 
                        //console.log(data);
                        const fd = data.feed;
                        const linkSource = `data:application/xml;base64,${fd}`;  
                        // const linkSource = `${xmlString}`;  
                        const downloadLink = document.createElement("a");
                        var dateObj  = new Date();
                        var month = dateObj.getUTCMonth() + 1; //months from 1-12
                        var day = dateObj.getUTCDate();
                        var year = dateObj.getUTCFullYear();
                        var date =  day+"-"+month+"-"+year;
                        var time = dateObj.getHours() + "-" + dateObj.getMinutes() + "-" + dateObj.getSeconds();
                        const fileName = "sparsando-feed_"+date+"_"+time+".xml";

                        // const fileName = "sparsando-feed.xml"; 

                        downloadLink.href = linkSource;
                        downloadLink.download = fileName;
                        downloadLink.click();
                    })
                    // const btx = window.btoa(xmlString);  
                    // console.log(btx);  
                    
                    // const linkSource = 'data:application/xml;base64,' + window.btoa((new XMLSerializer()).serializeToString(xmlDocument));        
                    

                    // console.log(xmlDocument);
                }

            }).fail(function(jqXHR,textStatus){  
               console.log(textStatus);
            });
        }
    });
    
    // UPLOAD CSV LSADMIN
    let dataA = [];
    $('#upload_csv_form').on('submit', function(event){ 
        event.preventDefault();
        $(this).addClass('uploading');
        if($.isEmptyObject(dataA)){
            dataA = [];
            var csvDataA = readCSVFile(this); 
            if($.isEmptyObject(csvDataA)){ 
                dataA = csvDataA;
                //$(this).find('input[type="submit"]').val('Upload Data');       
                console.log('no file selected');  
            }else{
                console.log('file selected');
            }
        }else{
            $(this).find("input[type='submit']").val('upload data');
            var formElem = $(this).closest('form');
            var doUpload = confirm("Upload data?");
            console.log(dataA);
            if(doUpload){
                console.log('upload'); 
                $.ajax({
                    type: 'POST',
                    url: 'https://sparsando.de/io.php',
                    data: {
                        'io': JSON.stringify(
                            {
                                'name': 'lsAdminFunctions', 
                                'params': [{'type':'uploadfeed', 'data':dataA}] 
                            }
                        ),
                    }
                }).done(function (data) {
                    console.log(data); 
                    // if(data.htmlencode){
                    //     let val = $("<textarea/>").html(data.htmlencode).val();  
                    //     if(val){
                    //         $(document).find('body').append(val);
                    //     }
                    // }  
                    $(this).removeClass('uploading'); 
                    formElem.prepend('<div class="suc-msg success">Data added</div>'); 
                    setTimeout(function() { 
                        $(this).find('.suc-msg').remove(); 
                    }, 2000);

                }).fail(function(jqXHR,textStatus){  
                    $(this).removeClass('uploading');  
                    formElem.prepend('<div class="suc-msg fail">something went wrong !</div>'); 
                    setTimeout(function() { 
                        $(this).find('.suc-msg').remove();
                    }, 2000);
                });
            }else{
                console.log('do not upload');
            }
        }
        
    });

    /**
     * 
     * open general popup
     * 
     */

    function openGeneralPopup(){
        let elem = $(this);
        var attr = elem.attr("popuptype");
        var type= "";
        var text= "";
        var name="";
        if (typeof attr !== 'undefined' && attr !== false) {
            type = attr;

            if(type == "sparsand"){
                name = "lsSparsandPopup";
            }
        }
        if(name){
            $.ajax({
                type: 'POST',
                url: 'https://sparsando.de/io.php',
                data: {
                    'io': JSON.stringify(
                        {
                            'name': name,
                            'params': [{'type':type}] 
                        }
                    ),
                }
            }).done(function (data) {
                //console.log(data);
                if(data.htmlencode){
                    let val = $("<textarea/>").html(data.htmlencode).val(); 
                    if(val){
                        $(document).find('body').append(val);
                    }
                }
            });
        }
    }

    /**
     * 
     * artikel anfrage form
     * 
     */

    function artikelAnfrageForm(){
        let elem = $(this);
        var artNo = elem.closest('.anfrage-btn-wrap').find('input.pno').val();
        var artId = elem.closest('.anfrage-btn-wrap').find('input.pid').val();
        var qty = elem.closest('.anfrage-btn-wrap').find('input.pqty').val();
        var title = elem.closest('.anfrage-btn-wrap').find('input.ptitle').val();
        var gtin = elem.closest('.anfrage-btn-wrap').find('input.pgtin').val(); 
        $.ajax({
            type: 'POST',
            url: 'https://sparsando.de/io.php',
            data: {
                'io': JSON.stringify(
                    {
                        'name': 'lsAnfrageForm',
                        'params': [{'type':'product', 'artNo':artNo, 'artId':artId, 'qty':qty, 'title':title, 'gtin':gtin}] 
                    }
                ),
            }
        }).done(function (data) {
            //console.log(data);
            if(data.htmlencode){
                console.log(data);
            let val = $("<textarea/>").html(data.htmlencode).val(); 
               if(val){
                $(document).find('body').append(val);
               }
            }
        });
    }
    /**
     * 
     * general anfrage form
     * 
     */

    function generalAnfrageForm(){
        let elem = $(this);
        var about = elem.closest('.frag-uns').find('input.about').val();
        $.ajax({
            type: 'POST',
            url: 'https://sparsando.de/io.php',
            data: {
                'io': JSON.stringify(
                    {
                        'name': 'lsAnfrageForm',
                        'params': [{'type':'general_product', 'about':about}] 
                    }
                ),
            }
        }).done(function (data) {
            //console.log(data);
            if(data.htmlencode){
                let val = $("<textarea/>").html(data.htmlencode).val(); 
                if(val){
                    $(document).find('body').append(val);
                }
            }
            
        });
    }
    /**
     * 
     * send prod anfrage email
     * 
     */

    function sendProdAnfrageEmail(){
        let elem = $(this);
        let pForm = elem.closest('form');
        var uName = pForm.find('input[name="uName"]').val();
        var uEmail = pForm.find('input[name="uEmail"]').val();
        var uText = pForm.find('textarea[name="uText"]').val();
        

        elem.closest('form').addClass('updating');
       
        var type = pForm.find('input[name="type"]').val();

        if(type == "product"){

            var pArtNo = pForm.find('input[name="pArtNo"]').val();
            var pGtin = pForm.find('input[name="pGtin"]').val();
            var pTitle = pForm.find('input[name="pTitle"]').val();
            var pQty = pForm.find('input[name="pQty"]').val();

            $.ajax({
                type: 'POST',
                url: 'https://sparsando.de/io.php',
                data: {
                    'io': JSON.stringify(
                        {
                            'name': 'lsSendProdAnfrageEmail',
                            'params': [{'type':type, 'pArtNo':pArtNo, 'uName':uName, 'uText':uText, 'uEmail':uEmail, 'pQty':pQty, 'pTitle':pTitle, 'pGtin':pGtin}] 
                        }
                    ),
                }
            }).done(function (data) {
                //console.log(data);
                if(data.success){
                    pForm.trigger("reset");
                    pForm.closest('.is-popup').remove();
                }
                elem.closest('form').removeClass('updating');
                
            });
        }
        if(type == "general_product"){
            var about = pForm.find('input[name="about"]').val(); 
            var isInline = pForm.find('input[name="isinline"]').val();
            var sText = pForm.find('input[name="stext"]').val();
            var fText = pForm.find('input[name="ftext"]').val();

            if(sText){
                sText = atob(sText);
            }
            if(fText){
                fText = atob(fText);
            }

            $.ajax({
                type: 'POST',
                url: 'https://sparsando.de/io.php',
                data: {
                    'io': JSON.stringify(
                        {
                            'name': 'lsSendProdAnfrageEmail',
                            'params': [{'type':type, 'about':about, 'uName':uName, 'uText':uText, 'uEmail':uEmail}] 
                        }
                    ),
                }
            }).done(function (data) {
                //console.log(data);
                if(data.success){
                    pForm.trigger("reset");
                    pForm.closest('.is-popup').remove();
                }
                elem.closest('form').removeClass('updating');
                addNotification(sText, "success", "popup");
            });
        }

    }


    /**
     * 
     * function add notification
     * 
     */
    
    function addNotification(text, type="success", dtype="popup"){
        if(text){
            if(dtype == "flash"){
                let notHtml = ''
                        +'<div class="ls-flash-not '+type+'">'
                        +'<div class="not-content-wrap">'+text+'</div>';
                        +'</div>'
                        +'';
                $('body').append(notHtml);

            }else{ 
                let notHtml = ''
                        +'<div class="ls-not is-popup  '+type+'">'
                            +'<div class="not-content-wrap">'
                                +'<div class="popup-title-wrap">'
                                    +'<div class="remove-popup">'
                                        +'<i class="fas fa-times"></i>'
                                    +'</div>'
                                +'</div>'
                                +'<div class="not-content">'+text+'</div>' 
                            +'</div>'
                        +'</div>'
                        +'';

                $('body').append(notHtml);
            }
        }
    }


    function updateCartItems(){
        let elem = $(this);
        //alert('update cart items');
        var artNo = elem.closest('form').find('input.form-control[name="a"]').val();
        console.log(artNo);
        setTimeout(function() { 
            $.ajax({
                type: 'POST',
                url: 'https://sparsando.de/io.php', 
                data: {
                    'io': JSON.stringify(
                        {
                            'name': 'lsGetCartItems',
                            'params': [{'type':'save_more', 'artNo':artNo}] 
                        }
                    ),
                }
            }).done(function (data) {
                //console.log(data); 
                //console.log(data.htmlencode); 
                if(data.htmlencode){
                    if($(document).find('.mehr-sparen-'+artNo).length > 0){
                        let val = $("<textarea/>").html(data.htmlencode).val(); 
                        $(document).find('.mehr-sparen-'+artNo+' .save-more-content').html(val);    
                    }else{
                        console.log('.mehr-sparen-'+artNo+'   not found');

                        if( elem.closest('.product-wrapper').find('.save-more-content').length > 0){
                            // elem.closest('.product-wrapper').find('.save-more-content').html(atob(data.content)); 
                            let val = $("<textarea/>").html(data.htmlencode).val(); 
                            elem.closest('.product-wrapper').find('.save-more-content').html(val);     
                        }
                    }
                    
                }
                
            });
        }, 700);
    }


    // trigger click for drop down search
    if($(document).find('.ls-search-wrap  span.cat-item.trigger-click').length > 0){
        if($(document).find('.ls-search-wrap  span.cat-item.active').length <= 0){
            $(document).find('.ls-search-wrap  span.cat-item.trigger-click').trigger('click');
            $(document).find('.ls-search-wrap  .fields-row').addClass('anim-shake');  
            $(document).find('.ls-search-wrap  span.cat-item.trigger-click').removeClass('trigger-click');
        }
    }
    

    // if($(document).find('.content-cats-small .col').length > 0){
    //     $(document).find('.content-cats-small .col:nth-child(2n)').addClass('addShakeRotateAnim');  
    //     $(document).find('.content-cats-small .col:nth-child(2n+1)').addClass('addShakeAnim');  
    // }

    function callAjax(){

        let catId   = $(this).attr('catid');
        let searchBy = $(this).attr('sby');
        let rcatids = $(this).attr('rcatids');
        let catName = $(this).attr('catname');
        let activeCat = $(this).attr('activecat');
        let isTest = $(this).attr('istest');

        if($(this).closest('.field-wrap').find('.input-btn .label-tab').length > 0){
            $(this).closest('.field-wrap').find('.input-btn .label-tab').html(catName);
        }
        if($(this).closest('.result-wrap').find('.cat-item').length > 0){
            $(this).closest('.result-wrap').find('.cat-item').removeClass('active');
        }
        
        $(this).addClass('active');

        //console.log(searchBy);
        $(document).find('.ls-search-wrap .by-tab.active .field-wrap  > label').addClass('searching');  

        /**
         *  type: products / childCategories / childProducts
         * 
         */
        
        let params = [{'type':searchBy, 'id': catId, 'ids':rcatids, 'activeCat':activeCat}] ;  
        // console.log(params);

            $.ajax({
                type: 'POST',
                url: 'https://sparsando.de/io.php',  
                data: {
                    'io': JSON.stringify(
                        {
                            'name': 'lsGetCatProducts',
                            'params': params
                        }
                    ),
                }
            }).done(function (data) {
                // console.log(data);
                if (data.success) {
                    // console.log(data.data.html);
                    // console.log(data.data.items);
                    if(data.data.html && searchBy == 'childCategories'){
                        $(document).find('.ls-search-wrap .printer-field-wrap').addClass('active');
                        $(document).find('.ls-search-wrap .printer-field-wrap .result-wrap .content').html(data.data.html);
                    }else{
                        $(document).find('.ls-search-wrap .printer-field-wrap').removeClass('active');
                        $(document).find('.ls-search-wrap .printer-field-wrap .result-wrap .content').html('');
                    }
                    if(data.data.html && searchBy == 'catProducts'){
                        $(document).find('.ls-search-wrap .prod-field-wrap').addClass('active');
                        $(document).find('.ls-search-wrap .prod-field-wrap .result-wrap .content').html(data.data.html);
                    }else{
                        $(document).find('.ls-search-wrap .prod-field-wrap').removeClass('active');
                        $(document).find('.ls-search-wrap .prod-field-wrap .result-wrap .content').html('');
                    }

                } else {
                    console.log('couldn\'t, load displacements for ');  
                    if(searchBy == 'childCategories'){
                        $(document).find('.ls-search-wrap .printer-field-wrap').removeClass('active');
                        $(document).find('.ls-search-wrap .printer-field-wrap .result-wrap .content').html("");
                    }
                    if(searchBy == 'catProducts'){
                        $(document).find('.ls-search-wrap .prod-field-wrap').removeClass('active');
                        $(document).find('.ls-search-wrap .prod-field-wrap .result-wrap .content').html("");
                    }
                }
                $(document).find('.ls-search-wrap .by-tab .field-wrap  > label').removeClass('searching');  
            }).fail(function (jqXHR, textStatus) {
                console.log('failed');
                console.log(jqXHR);
                $(document).find('.ls-search-wrap .by-tab .field-wrap  > label').removeClass('searching'); 
                if(searchBy == 'childCategories'){
                    $(document).find('.ls-search-wrap .printer-field-wrap').removeClass('active');
                    $(document).find('.ls-search-wrap .printer-field-wrap .result-wrap .content').html("");
                }
                if(searchBy == 'catProducts'){
                    $(document).find('.ls-search-wrap .prod-field-wrap').removeClass('active');
                    $(document).find('.ls-search-wrap .prod-field-wrap .result-wrap .content').html("");
                }
            });
    }


    function ajaxSearchProducts(e){
        let elem =  $(this);
        let keyWord = elem.val();
        let searchBy = 'searchProducts';
        $.ajax({
            type: 'POST',
            url: 'https://sparsando.de/io.php',
            data: {
                'io': JSON.stringify(
                    {
                        'name': 'lsGetCatProducts',
                        'params': [{'type':searchBy, 'id': null, 'ids':null, 'activeCat':null, 'keyWord':keyWord}] 
                    }
                ),
            }
        }).done(function (data) {
            console.log(data);
        });
        
    }

    function submitDdsForm2(e){
        switch(e.which)
        {
            case 1:
                //left Click
            break;
            case 2:
                //middle Click
                $(this).closest('form').attr("target", "_blank").submit();
            break;
            case 3:
                //right Click
            break;
        }
        return true;
    };
    function submitDdsForm(){
        $(this).closest('form').attr("target", "").submit();
    }
    function redirectCustomPage(){
        $elem = $(this);
        $elem.addClass('is-loading');  
        $ids = $elem.attr('cids');
        $idsB = btoa($ids);
        $key = $elem.attr('key');
        $keyB = btoa($.trim($key)); 
        $ptype = $elem.attr('ptype');
        $url = $elem.attr('href');
        //console.log($ids);  
        // $.get('https://rebuilt-toner.shop-template.de/jtl-test-page', {'data':'somedata'}); 
        console.log($ptype+' '+$ids);
        $(document).ready(function(){
            $('<form action="/search-results?sqs='+$idsB+'&p='+$ptype+'&k='+$keyB+'" method="post"><input type="hidden" name="key" value="'+$key+'"><input type="hidden" name="ptype" value="'+$ptype+'"><input type="hidden" name="ids" value="'+$ids+'"></form>').appendTo('body').submit();
        });
    }



    $(document).on('click', '.tab-btn:not(.active)', function(e){
        var elem = $(this);
        var sfor = elem.attr('sfor');

        if(!elem.hasClass('active')){
            $(document).find('.ls-search-wrap .label-tab').each(function(e){
                $(this).text($(this).attr('tabtext'));
            })
            $(document).find('.ls-search-wrap .prod-field-wrap .result-wrap .content').html(''); 
            $(document).find('.ls-search-wrap .printer-field-wrap .result-wrap .content').html('');  
            $(document).find('.ls-search-wrap .result-wrap .content .result-item').removeClass('active');   
            $(document).find('.ls-search-wrap .printer-field-wrap').removeClass('active');
            $(document).find('.ls-search-wrap .prod-field-wrap').removeClass('active');
        }

        elem.closest('.tab-btns-wrap').find('.tab-btn').removeClass('active');
        elem.closest('.ls-search-wrap').find('.by-tab').removeClass('active');
        elem.addClass('active');
        elem.closest('.ls-search-wrap').find('.by-tab.'+elem.attr('tab')).addClass('active');
        elem.closest('.ls-search-wrap').find('.cat-item.sfor').attr('sby', sfor); 

        $(document).find('.ls-search-wrap .by-tab .field-wrap > label').removeClass('searching');  
        
    });


    $(document).on('change', '.ls-search-wrap .tab-btn-toggle', function(e){
        var elem = $(this);
        var cls = '';
        var sfor = '';
        var toggleSec = '';
        if(elem.is(":checked")){
            cls = 'active';
            sfor = elem.attr('oncheck');
            toggleSec = elem.attr('toggleoncheck');
        }else{
            cls = '';
            sfor = elem.attr('onuncheck');
            toggleSec = elem.attr('toggleonuncheck');
        }
        $(document).find('.ls-search-wrap .label-tab').each(function(e){
            $(this).text($(this).attr('tabtext'));
        })
        //reset settings to default
        $(document).find('.ls-search-wrap .prod-field-wrap .result-wrap .content').html(''); 
        $(document).find('.ls-search-wrap .printer-field-wrap .result-wrap .content').html('');  
        $(document).find('.ls-search-wrap .result-wrap .content .result-item').removeClass('active');   
        $(document).find('.ls-search-wrap .by-tab .input-btn').removeClass('active');   
        $(document).find('.ls-search-wrap .result-wrap').removeClass('active');   
        $(document).find('.ls-search-wrap .printer-field-wrap').removeClass('active');
        $(document).find('.ls-search-wrap .prod-field-wrap').removeClass('active');
        // reset settings as per btn
        elem.closest('.ls-search-wrap').find('.by-tab').removeClass('active');
        elem.closest('.ls-search-wrap').find('.cat-item.sfor').attr('sby', sfor); 
        elem.closest('.ls-search-wrap').find('.by-tab.'+toggleSec).addClass('active');

        $(document).find('.ls-search-wrap .by-tab .field-wrap > label').removeClass('searching');  
        //console.log(cls+' '+sfor);
    })

    $(document).on('click', '.ls-search-wrap  span.cat-item', function(e){

        hideLsSearchDropDown();
    });
    $(document).on('click', '.ls-search-wrap  .input-btn', function(e){
        var elem = $(this);
        //elem.removeClass('active'); 
        if(!elem.hasClass('active')){
            $(document).find('.ls-search-wrap .result-wrap').removeClass('active');
            $(document).find('.ls-search-wrap .input-btn').removeClass('active');
            elem.addClass('active');
            elem.closest('label').find('.result-wrap').addClass('active');
        }else{
            $(document).find('.ls-search-wrap .result-wrap').removeClass('active');
            $(document).find('.ls-search-wrap .input-btn').removeClass('active');
            elem.removeClass('active');
            elem.closest('label').find('.result-wrap').removeClass('active');
        }
    });

    $(document).on('keyup', '.ls-search-wrap  .search-input', function(e){
        var elem = $(this);
        var rValue = $.trim(elem.val().replace(/\s\s+/g, ' ')).toLowerCase(); 
        var value = elem.val().toLowerCase().replace(/\s/g,'').replace(/[_+-\W]+/g, '').trim();
        //console.log(rValue);  
        if(value && value != ''){
            elem.closest('label').find('.result-item').each(function(index){
                let nVal = $(this).text().toLowerCase().replace(/\s/g,'').replace(/[_+-\W]+/g, '').trim();
                //console.log(nVal.toLowerCase());
                if (nVal.indexOf(value) >= 0){ 
                    $(this).removeClass('hide');
                }else{
                    $(this).addClass('hide');
                }
            });
            
            // loose matches
            var rValueA = rValue.split(" ");
            let looseMatches = '';

            if($.isArray(rValueA) && rValueA.length > 0){
                var matchesL = rValueA.length;
                elem.closest('label').find('.result-item').each(function(index){
                    var matches = 0;
                    let nVal = $.trim($(this).text().replace(/\s\s+/g, ' ')).toLowerCase(); 
                    //console.log(nVal.toLowerCase());
                    $.each(rValueA, function( index, value ) {
                        if (nVal.indexOf(value) >= 0){ 
                            matches ++;
                        }
                    });

                    if(matches == matchesL){
                        $(this).removeClass('hide');
                        //looseMatches +=  "-------------- \n ---------"+ nVal;
                    }
                    
                });

                //console.log(looseMatches);
            }

        }else{
            elem.closest('label').find('.result-item').removeClass('hide');
        }
    });

    $(document).on('click', (e)=>{
        //console.log(e.target)
        if($(e.target).hasClass('input-btn') || $(e.target).closest('.ls-search-wrap').length > 0){
            //console.log('is element');
        }else{
            hideLsSearchDropDown();
        }
    });

    function hideLsSearchDropDown(clearData = false){
        $(document).find('.ls-search-wrap .result-wrap').removeClass('active');
        $(document).find('.ls-search-wrap .input-btn').removeClass('active');
        $(document).find('.ls-search-wrap .input-btn').removeClass('active');
        if(clearData){
            $(document).find('.ls-search-wrap .label-tab').each(function(e){
                $(this).text($(this).attr('tabtext'));
            })

            $(document).find('.prod-field-wrap .result-wrap .content').html(''); 
            $(document).find('.printer-field-wrap .result-wrap .content').html('');  
        }
    }


    /**
     * 
     * close popup
     * 
     */
     $(document).on('click', '.remove-popup', function(){
        $(this).closest('.is-popup').remove();
     });


    

}) 
