/**
*
* Custom Portlet
* Name: NewProducts
* Desc: Add new Products with Desc sorting order based on date.
*
*/


/*---------- FIELDS ------------*/
+ products_type 
    + type of products: neu, top, comming soon etc.
+ sort_order [asc / desc]
+ max_products <number>
+ list_style [gallery / slider]
+ title <text, html>
+ description <text, html>
+ default_text <text,html>
    + this text will show when there are no products in the selected category
+ crossselling <TEXT_LIST>
    + to show custom columns in between Products
    + format: pos::imageurl::link||linkLabel::text::style<imgleft/imgright/imgcenter/imgtop/imgbottom> |||| so on....
        + attrrs: 
            + pos        -> <NUMBER>: after how many products should new col be displayed
            + imageurl   -> <URL> image url to be displayed in the section
            + linkurl    -> <URL>redirect link
            + text       -> Text to be displayed in section
            + style      -> [imageleft, imageright, imagecenter, imagetop, imagebottom]
            + ex: 
                3::https://mens-shop24.de/images/logos/new_images/banner_2.jpg::https://mens-shop24.shop-template.de/fesseln-bondage||Shop Now::I am the Boss 3::imageright ||||
                5::https://mens-shop24.de/images/logos/new_images/bondage.jpg::https://mens-shop24.shop-template.de/analtoys||jetzt Bestellen::Some other Text 5::imagetop ||||
                7::https://mens-shop24.shop-template.de/media/image/storage/opc/rectangle_796_bi.png::https://mens-shop24.shop-template.de/fesseln-bondage||::I am the Boss 7::imagebottom ||||
                9::https://mens-shop24.de/images/logos/new_images/dessous.jpg::https://mens-shop24.shop-template.de/analtoys::Some Klinik Toys::imagecenter ||||



