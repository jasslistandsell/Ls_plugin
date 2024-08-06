{if $isPreview}
    {$data=['portlet' => $instance->getDataAttribute()]}  
{/if}
{row data=$data|default:null 
class=$instance->getAnimationClass()|cat:' '|cat:$instance->getStyleClasses() 
style=$instance->getStyleString() }
    {assign 'wrap_class' $instance->getProperty('wrap_class')}
    {assign 'cat_field_label' $instance->getProperty('cat_field_label')}
    {assign 'cat_field_info' $instance->getProperty('cat_field_info')}
    {assign 'cat_field_placeholder' $instance->getProperty('cat_field_placeholder')}

    {assign 'prod_number_label' $instance->getProperty('prod_number_label')}
    {assign 'prod_number_info' $instance->getProperty('prod_number_info')}
    {assign 'prod_number_placeholder' $instance->getProperty('prod_number_placeholder')}

    {assign 'modal_number_label' $instance->getProperty('modal_number_label')}
    {assign 'modal_number_info' $instance->getProperty('modal_number_info')}
    {assign 'modal_number_placeholder' $instance->getProperty('modal_number_placeholder')}

    {assign 'search_by_prod_title' $instance->getProperty('search_by_prod_title')}
    {assign 'search_by_printer_title' $instance->getProperty('search_by_printer_title')} 
    {assign 'default_select' $instance->getProperty('default_select')} 
    {assign 'sec_title' $instance->getProperty('sec_title')} 
    {assign 'sec_subtitle' $instance->getProperty('sec_subtitle')} 
    {assign 'btns_title' $instance->getProperty('btns_title')} 
    {assign 'footer_html' $instance->getProperty('footer_html')} 
    {assign 'display_cats' $instance->getProperty('display_cats')} 
    {assign 'display_slider' $instance->getProperty('display_slider')} 
    {assign 'display_style' $instance->getProperty('display_style')} 
    {assign 'slide1_color' $instance->getProperty('slide1_color')} 
    {assign 'default_back_color' $instance->getProperty('default_back_color')}  

    {if $slide1_color}
        {$default_back_color = $slide1_color} 
    {/if}

    {assign 'selectPrinter' ''}
    {assign 'checkToggle' ''}
    {assign 'selectProduct' 'active'}
    {assign 'selectBy' 'catProducts'}
    {* {$default_select} *}
    {if $default_select == 'printer'}
        {assign 'selectPrinter' 'active'}
        {assign 'selectBy' 'childCategories'}
        {assign 'selectProduct' ''}
        {assign 'checkToggle' ''}
    {else}
        {assign 'checkToggle' 'checked'}
        {assign 'selectPrinter' ''}
        {assign 'selectProduct' 'active'}
        {assign 'selectBy' 'catProducts'}
    {/if}

    <div class="col col-12 ls-search-outer {$display_style}" style="background-color: {$default_back_color}">
        <div class="col col-12 container">
            {assign 'fSize' '12'}
            {assign 'pRowCls' ''}
            {if $display_slider == 'yes'}
                {$fSize = '4'}
                {assign 'pRowCls' 'has-slider'}
            {/if}
            {if $display_style == 'horizontal'} 
                {*
                  
                  HORIZONTAL SEARCH
                
                *}
                {row class="wrap-parent jc-center"}
                    {col cols="12" class="ls-search-wrap no-shadow"}
                        {if !isset($activeId)}
                            {if $NaviFilter->hasCategory()}
                                {$activeId = $NaviFilter->getCategory()->getValue()}
                            {elseif $nSeitenTyp === $smarty.const.PAGE_ARTIKEL && isset($Artikel)}
                                {$activeId = $Artikel->gibKategorie()}
                            {elseif $nSeitenTyp === $smarty.const.PAGE_ARTIKEL && isset($smarty.session.LetzteKategorie)}
                                {$activeId = $smarty.session.LetzteKategorie}
                            {else}
                                {$activeId = 0}
                            {/if}
                        {/if}

                        <div class="search-wrap-header">
                            {if $sec_title}
                                <h2 class="sec-title lg default">{$sec_title}</h2>
                            {/if}
                            {if $sec_subtitle}
                                <h3 class="sec-subtitle">{$sec_subtitle}</h3> 
                            {/if}
                        </div>

                        <div class="tab-btns-wrap">

                            {row class=""}
                                {col cols="12"}
                                    <div class="checkbox-toggle">
                                        <input type="checkbox" class="tab-btn-toggle" id="ls-toggle-lsfor" value="y" 
                                            onuncheck="childCategories" 
                                            toggleonuncheck="tab-p"
                                            oncheck="catProducts" 
                                            toggleoncheck="tab-pn"
                                            {$checkToggle}
                                        />
                                        <label for="ls-toggle-lsfor">
                                                <span class="uncheck-text">{$search_by_printer_title} </span>
                                                <span class="toggle-slider"></span>
                                                <span class="check-text">{$search_by_prod_title}</span>
                                        </label>
                                    </div>
                                {/col}
                            {/row}
                        </div>
                        {row class="fields-row"}
                            {* {col cols="12" class="fields-wrap"}
                            {/col} *}

                            
                            {col cols="6" class="field-wrap cat-field-wrap"}
                                <label>
                                    <span class="field-label has-info">
                                        {$cat_field_label}
                                        <span class="info-icon"><img src="/media/image/icons/info-icon.svg"></span>
                                        {if $cat_field_info}
                                        <div class="info-content">
                                            {$cat_field_info}
                                        </div>
                                        {/if}
                                    </span>
                                    <div class="input-btn">
                                        <span class="label label-tab" cid="" tabtext="{$cat_field_label}">{$cat_field_label}</span>
                                        <span class="icon"> <i class="fa fa-angle-down"></i></span>
                                    </div>

                                    {ls_get_level2_cat getUnique=false assign="catsL2" activeCat=$activeId}

                                    {assign var="idsA" value=$catsL2['idsA']}
                                    {assign var="pIds" value=$catsL2['pIds']}
                                    {assign var="topCats" value=$catsL2['topCats']}
                                    
                                    <div class="result-wrap ">
                                        {* {if $cat_field_placeholder}
                                            <span class="input-placeholder">
                                                {$cat_field_placeholder}
                                            </span>
                                        {/if} *}
                                        <input type="text" field="category"  cid="" class="search-input ls-cat" placeholder="{$cat_field_placeholder}"/> 
                                        
                                        <div class="content">
                                            
                                            {if $catsL2['catsL2']}
                                            
                                                {foreach $catsL2['catsL2'] as $k=>$childCat2} 
                                                    {assign var="childCat" value=$childCat2['cat']}
                                                    {assign var="cat1" value=$childCat2['cat1']} 
                                                    {assign var="childCatName" value=$childCat2['name']}
                                                    {assign var="pCat" value=$childCat2['pCat']}
                                                    {assign var="idsKey" value=$childCat2['idsKey']}
                                                    {assign var="pIds" value=$childCat2['pIds']}
                                                    {assign var="rCatsIds" value=''}

                                                    {if $idsA[$idsKey]['ids']}
                                                        {$rCatsIds= $idsA[$idsKey]['ids']}
                                                    {/if}
                                                    
                                                    {assign var='pName' value="{$childCat->getShortName()|trim}"}
                                                    {if $childCat->dName}
                                                        {$pName = $childCat->dName}
                                                    {/if}
                                                    <span 
                                                        class="cat-item result-item sfor" 
                                                        catname="{$pName}" 
                                                        catid="{$childCat->getID()}"
                                                        sby= {$selectBy}
                                                        rcatids= {$rCatsIds}
                                                        activecat = {$activeId} 
                                                        pcat = {$pCat}
                                                        istest="no"
                                                    >
                                                        {$pName} 

                                                    </span>
                                                {/foreach}
                                            {/if}
                                        </div>
                                    </div>
                                </label>
                            {/col}

                            {col cols="6" class="tab1 by-tab {$selectProduct} tab-pn "}
                                {col cols="12" class="field-wrap prod-field-wrap"}
                                    <label>
                                        <span class="field-label has-info">
                                            {$prod_number_label}
                                            <span class="info-icon"><img src="/media/image/icons/info-icon.svg"></span>
                                            {if $prod_number_info}
                                            <div class="info-content">
                                                {$prod_number_info}
                                            </div>
                                            {/if}
                                        </span>
                                        </span>
                                        <div class="input-btn">
                                            <span class="label label-tab" tabtext="{$prod_number_label}" cid="">{$prod_number_label}</span>
                                            <span class="icon"> <i class="fa fa-angle-down"></i></span>
                                        </div>

                                        <div class="result-wrap">
                                            {* {if $prod_number_placeholder}
                                                <span class="input-placeholder">
                                                    {$prod_number_placeholder}
                                                </span>
                                            {/if} *}
                                            <input type="text" field="product" cid="" class="search-input ls-prod"  placeholder="{$prod_number_placeholder}"/>
                                            <div class="content">
                                                
                                            </div>
                                        </div>
                                    </label>
                                {/col}
                            {/col}
                            {col cols="6" class="tab2 by-tab {$selectPrinter} tab-p"}
                                {col cols="12" class="field-wrap printer-field-wrap"}
                                    <label>
                                        <span class="field-label has-info">
                                            {$modal_number_label}
                                            <span class="info-icon"><img src="/media/image/icons/info-icon.svg"></span>
                                            {if $modal_number_info}
                                            <div class="info-content">
                                                {$modal_number_info}
                                            </div>
                                            {/if}
                                        </span>
                                        <div class="input-btn">
                                            <span class="label label-tab" tabtext="{$modal_number_label}" cid="">{$modal_number_label}</span>
                                            <span class="icon"> <i class="fa fa-angle-down"></i></span>
                                        </div>
                                        <div class="result-wrap">
                                            {* {if $modal_number_placeholder}
                                                <span class="input-placeholder">
                                                    {$modal_number_placeholder}
                                                </span>
                                            {/if} *}
                                            <input type="text" field="printer" cid="" class="search-input ls-printer" placeholder="{$modal_number_placeholder}"/>
                                            <div class="content">
                                            </div>
                                        </div>
                                    </label>
                                {/col}
                            {/col}
                        {/row}
                    {/col}
                {/row}
            {else}
                {*
                  
                  VERTICAL SEARCH
                
                *}
                {row class="wrap-parent {$pRowCls}"}
                    {col cols=$fSize class="ls-search-col small"}
                        <div class="ls-search-main-content ls-search-wrap small">
                        {if !$isPreview} 
                            {if !isset($activeId)}
                                {if $NaviFilter->hasCategory()}
                                    {$activeId = $NaviFilter->getCategory()->getValue()}
                                {elseif $nSeitenTyp === $smarty.const.PAGE_ARTIKEL && isset($Artikel)}
                                    {$activeId = $Artikel->gibKategorie()}
                                {elseif $nSeitenTyp === $smarty.const.PAGE_ARTIKEL && isset($smarty.session.LetzteKategorie)}
                                    {$activeId = $smarty.session.LetzteKategorie}
                                {else}
                                    {$activeId = 0}
                                {/if}
                            {/if}

                            {* {$activeId} *}

                            <div class="search-wrap-header">
                                {if $sec_subtitle}
                                    <h3 class="sec-subtitle">{$sec_subtitle}</h3> 
                                {/if}
                                {if $sec_title}
                                    <h2 class="sec-title">{$sec_title}</h2>
                                {/if}
                            </div>

                            <div class="tab-btns-wrap">
                                {* {if $btns_title}
                                    <h3 class="btns-title">{$btns_title}</h3>
                                {/if} *}
                                {row class=""}
                                    {col cols="12" class=""}
                                        <div class="checkbox-toggle-big">
                                            <input type="checkbox" class="tab-btn-toggle" id="ls-toggle-lsfor" value="y" 
                                                onuncheck="childCategories" 
                                                toggleonuncheck="tab-p"
                                                oncheck="catProducts" 
                                                toggleoncheck="tab-pn"
                                                {$checkToggle}
                                            />
                                            <label for="ls-toggle-lsfor">
                                                <span class="toggle-text">
                                                    <span class="uncheck-text">{$search_by_printer_title} </span>
                                                    <span class="check-text">{$search_by_prod_title}</span>
                                                </span>
                                            </label>
                                        </div>
                                    {/col}

                                {/row}
                            </div>
                            {row class="fields-row"}

                                {col cols="6" class="field-wrap cat-field-wrap"}
                                    <label>
                                        <div class="input-btn">
                                            <span class="label label-tab" cid="" tabtext="{$cat_field_label}">{$cat_field_label}</span>
                                            <span class="icon"> <i class="fa fa-angle-down"></i></span>
                                        </div>
                                        {ls_get_level2_cat getUnique=false assign="catsL2" activeCat=$activeId}

                                        {assign var="idsA" value=$catsL2['idsA']}
                                        {assign var="pIds" value=$catsL2['pIds']}
                                        {assign var="topCats" value=$catsL2['topCats']}

                                        <div class="result-wrap ">
                                            {* {if $cat_field_placeholder}
                                                <span class="input-placeholder">
                                                    {$cat_field_placeholder}
                                                </span>
                                            {/if} *}
                                            <input type="text" field="category"  cid="" class="search-input ls-cat" placeholder="{$cat_field_placeholder}"/>
                                            
                                            <div class="content">
                                                
                                                {if $catsL2['catsL2']}
                                                
                                                    {foreach $catsL2['catsL2'] as $k=>$childCat2} 
                                                        {assign var="childCat" value=$childCat2['cat']}
                                                        {assign var="cat1" value=$childCat2['cat1']} 
                                                        {assign var="childCatName" value=$childCat2['name']}
                                                        {assign var="pCat" value=$childCat2['pCat']}
                                                        {assign var="idsKey" value=$childCat2['idsKey']}
                                                        {assign var="pIds" value=$childCat2['pIds']}
                                                        {assign var="rCatsIds" value=''}

                                                        {if $idsA[$idsKey]['ids']}
                                                            {$rCatsIds= $idsA[$idsKey]['ids']} 
                                                        {/if}
                                                        {assign var='pName' value="{$childCat->getShortName()|trim}"}
                                                        {if $childCat->dName}
                                                            {$pName = $childCat->dName} 
                                                        {/if}
                                                        <span 
                                                            class="cat-item result-item sfor" 
                                                            catname="{$pName}" 
                                                            catid="{$childCat->getID()}"
                                                            sby= {$selectBy}
                                                            rcatids= {$rCatsIds}
                                                            activecat = {$activeId} 
                                                            pcat = {$pCat}
                                                        >
                                                            {$pName}
                                                            {if $childCat->imageURL}
                            
                                                            {/if}
                
                                                        </span>
                                                    {/foreach}
                                                {/if}
                                            </div>
                                        </div>
                                    </label>
                                {/col}

                                {col cols="6" class="tab1 by-tab {$selectProduct} tab-pn "}
                                    {col cols="12" class="field-wrap prod-field-wrap"}
                                        <label>
                                
                                            <div class="input-btn">
                                                <span class="label label-tab" tabtext="{$prod_number_label}" cid="">{$prod_number_label}</span>
                                                <span class="icon"> <i class="fa fa-angle-down"></i></span>
                                            </div>

                                            <div class="result-wrap">
                                                {* {if $prod_number_placeholder}
                                                    <span class="input-placeholder">
                                                        {$prod_number_placeholder}
                                                    </span>
                                                {/if} *}
                                                <input type="text" field="product" cid="" class="search-input ls-prod" placeholder="{$prod_number_placeholder}"/>
                                                <div class="content">
                                                    
                                                </div>
                                            </div>
                                        </label>
                                    {/col}
                                {/col}
                                {col cols="6" class="tab2 by-tab {$selectPrinter} tab-p"}
                                    {col cols="12" class="field-wrap printer-field-wrap"}
                                        <label>
                                
                                            <div class="input-btn">
                                                <span class="label label-tab" tabtext="{$modal_number_label}" cid="">{$modal_number_label}</span>
                                                <span class="icon"> <i class="fa fa-angle-down"></i></span>
                                            </div>
                                            <div class="result-wrap">
                                                {* {if $modal_number_placeholder}
                                                    <span class="input-placeholder">
                                                        {$modal_number_placeholder}
                                                    </span>
                                                {/if} *}
                                                <input type="text" field="printer" cid="" class="search-input ls-printer" placeholder="{$modal_number_placeholder}"/>
                                                <div class="content">
                                                </div>
                                            </div>
                                        </label>
                                    {/col}
                                {/col}
                            {/row}

                            <div class="search-wrap-footer">
                                {if $footer_html}
                                    {$footer_html}
                                {/if}
                            </div>
                        {else}
                            <h2 style="text-align:center; color:#ff2a40; font-weight:800 ;padding-top:0.5em; margin-bottom:0em;"> 
                                <i class="fas fa-search-plus" style="color:#ee3546"></i><br>LS Category Search
                            </h2>
                            <p style="font-size:17px; font-weight:600; text-align:center; color:#696969; font-style:italic">*Check preview for result</p>
                        {/if}
                        </div>
                    {/col}
                    {if $display_slider == 'yes' }
                        {col cols='8' class="ls-search-slider-wrap"}
                        {assign "nSlides" value=[1,2,3,4,5,6,7,8]}

                            {if !$isPreview}
                                {assign 'slide1_img' $instance->getProperty('slide1_img')} 
                                {assign 'slide2_img' $instance->getProperty('slide2_img')} 
                                {assign 'slide3_img' $instance->getProperty('slide3_img')}  
                                {assign 'slide4_img' $instance->getProperty('slide4_img')}  
                                {if $slide1_img || $slide2_img || $slide3_img || $slide4_img}
                                    <div class="ls-search-slider ">
                                        
                                        {foreach $nSlides as $slideN}
                                            {if $instance->getProperty("slide{$slideN}_active") == 'yes' && $instance->getProperty("slide{$slideN}_img")}
                                                {assign 'slide_img' $instance->getProperty("slide{$slideN}_img")} 
                                                {assign 'slide_title' $instance->getProperty("slide{$slideN}_title")} 
                                                {assign 'slide_color' $instance->getProperty("slide{$slideN}_color")} 
                                                {assign 'slide_subtitle' $instance->getProperty("slide{$slideN}_subtitle")} 
                                                {assign 'slide_link' $instance->getProperty("slide{$slideN}_link")} 
                                                {assign 'slide_link_label' $instance->getProperty("slide{$slideN}_link_label")} 
                                                {assign 'slide_link_alt' $instance->getProperty("slide{$slideN}_link_alt")} 
                                                <div class="slide-{$slideN}" backcolor="{$slide_color}">
                                                    <div class="content-wrap">
                                                        <div class="text-section">
                                                            <h2>{$slide_title}</h2>
                                                            <h3>{$slide_subtitle}</h3>
                                                            {if $slide_link}
                                                                <a href="{$slide_link}" alt="{$slide_link_alt}" title="{$slide_link_label}">
                                                                    <span class="label">{$slide_link_label}</span>
                                                                </a>
                                                            {/if}
                                                        </div>
                                                        <div class="img-section">
                                                            {image lazy=true webp=false
                                                                src="/media/image/storage/opc/{$slide_img}" 
                                                                alt="{$slide_title}"
                                                            }
                                                        </div>
                                                    </div>
                                                </div>
                                            {/if}
                                        {/foreach} 
                                        <!-- slide 1 -->
                                        {* {if $slide1_img}
                                            {assign 'slide1_title' $instance->getProperty('slide1_title')} 
                                            {assign 'slide1_color' $instance->getProperty('slide1_color')} 
                                            {assign 'slide1_subtitle' $instance->getProperty('slide1_subtitle')} 
                                            {assign 'slide1_link' $instance->getProperty('slide1_link')} 
                                            {assign 'slide1_link_label' $instance->getProperty('slide1_link_label')} 
                                            {assign 'slide1_link_alt' $instance->getProperty('slide1_link_alt')} 
                                            <div class="slide-1" backcolor="{$slide1_color}">
                                                <div class="content-wrap">
                                                    <div class="text-section">
                                                        <h2>{$slide1_title}</h2>
                                                        <h3>{$slide1_subtitle}</h3>
                                                        {if $slide1_link}
                                                            <a href="{$slide1_link}" alt="{$slide1_link_alt}" title="{$slide1_link_label}">
                                                                <span class="label">{$slide1_link_label}</span>
                                                            </a>
                                                        {/if}
                                                    </div>
                                                    <div class="img-section">
                                                    
                                                        {image lazy=true webp=false
                                                            src="/media/image/storage/opc/{$slide1_img}"
                                                            alt=""
                                                        }
                                                    </div>
                                                </div>
                                            </div>
                                        {/if} *}
                                        <!-- slide 2 -->
                                        {* {if $slide2_img}
                                            {assign 'slide2_title' $instance->getProperty('slide2_title')} 
                                            {assign 'slide2_color' $instance->getProperty('slide2_color')} 
                                            {assign 'slide2_subtitle' $instance->getProperty('slide2_subtitle')} 
                                            {assign 'slide2_link' $instance->getProperty('slide2_link')} 
                                            {assign 'slide2_link_label' $instance->getProperty('slide2_link_label')} 
                                            {assign 'slide2_link_alt' $instance->getProperty('slide2_link_alt')} 
                                            <div class="slide-2" backcolor="{$slide2_color}">
                                                <div class="content-wrap">
                                                    <div class="text-section">
                                                        <h2>{$slide2_title}</h2>
                                                        <h3>{$slide2_subtitle}</h3>
                                                        {if $slide2_link}
                                                            <a href="{$slide2_link}" alt="{$slide2_link_alt}" title="{$slide2_link_label}">
                                                                <span class="label">{$slide2_link_label}</span>
                                                            </a>
                                                        {/if}
                                                    </div>
                                                    <div class="img-section">
                                                        
                                                        {image lazy=true webp=false
                                                            src="/media/image/storage/opc/{$slide2_img}"
                                                            alt=""
                                                        }
                                                    </div>
                                                </div>
                                            </div>
                                        {/if} *}
                                        <!-- slide 3 -->
                                        {* {if $slide3_img}
                                            {assign 'slide3_title' $instance->getProperty('slide3_title')} 
                                            {assign 'slide3_color' $instance->getProperty('slide3_color')} 
                                            {assign 'slide3_subtitle' $instance->getProperty('slide3_subtitle')} 
                                            {assign 'slide3_link' $instance->getProperty('slide3_link')} 
                                            {assign 'slide3_link_label' $instance->getProperty('slide3_link_label')} 
                                            {assign 'slide3_link_alt' $instance->getProperty('slide3_link_alt')} 
                                            <div class="slide-3" backcolor="{$slide3_color}">
                                                <div class="content-wrap">
                                                    <div class="text-section">
                                                        <h2>{$slide3_title}</h2>
                                                        <h3>{$slide3_subtitle}</h3>
                                                        {if $slide3_link}
                                                            <a href="{$slide3_link}" alt="{$slide3_link_alt}" title="{$slide3_link_label}">
                                                                <span class="label">{$slide3_link_label}</span>
                                                            </a>
                                                        {/if}
                                                    </div>
                                                    <div class="img-section">
                                                      
                                                        {image lazy=true webp=false
                                                            src="/media/image/storage/opc/{$slide3_img}"
                                                            alt=""
                                                        }
                                                    </div>
                                                </div>
                                            </div>
                                        {/if} *}
                                        <!-- slide 4 -->
                                        {* {if $slide4_img}
                                            {assign 'slide4_title' $instance->getProperty('slide4_title')} 
                                            {assign 'slide4_color' $instance->getProperty('slide4_color')} 
                                            {assign 'slide4_subtitle' $instance->getProperty('slide4_subtitle')} 
                                            {assign 'slide4_link' $instance->getProperty('slide4_link')} 
                                            {assign 'slide4_link_label' $instance->getProperty('slide4_link_label')} 
                                            {assign 'slide4_link_alt' $instance->getProperty('slide4_link_alt')} 
                                            <div class="slide-4" backcolor="{$slide4_color}">
                                                <div class="content-wrap">
                                                    <div class="text-section">
                                                        <h2>{$slide4_title}</h2>
                                                        <h3>{$slide4_subtitle}</h3>
                                                        {if $slide4_link}
                                                            <a href="{$slide4_link}" alt="{$slide4_link_alt}" title="{$slide4_link_label}">
                                                                <span class="label">{$slide4_link_label}</span>
                                                            </a>
                                                        {/if}
                                                    </div>
                                                    <div class="img-section">
                                                        
                                                        {image lazy=true webp=false
                                                            src="/media/image/storage/opc/{$slide4_img}"
                                                            alt=""
                                                        }
                                                    </div>
                                                </div>
                                            </div>
                                        {/if} *}
                                    </div>

                                    <div class="slider-nav ls-slider-nav">
                                        <div class="prev slick-arrow">Prev</div>
                                        <div id="mainSlider__dots1" class="slick-dots-append"></div> 
                                        <div class="next slick-arrow">Next</div>
                                    </div>
                                {/if}
                            {else}
                                <div style="background-color:#fff; height:100%; display:flex; padding:10px 5px; flex-direction:column; color:#efefef; justify-content:center; align-items:center; border-radius:20px;">
                                    {image alt='ProductStream' src="{$portlet->getBaseUrl()}/slider-img.svg" style="position:relative; width:50%; height:auto;"}
                                    <h2 style="text-align:center; color:#ff2a40; font-weight:800 ;padding-top:0.5em; margin-bottom:0em;"> 
                                        Slider
                                    </h2>
                                </div>
                            {/if}
                        {/col}
                    {/if}
                {/row}
            {/if}
        </div>
    </div>

    {* {if $display_style == 'horizontal'} 
        {if !$isPreview}
            {row class="jc-center"}
                
            {/row}
        {else}
            <h2 style="text-align:center; color:#ff2a40; font-weight:800 ;padding-top:0.5em; margin-bottom:0em;"> 
                <i class="fas fa-search-plus" style="color:#ee3546"></i><br>LS Category Search
            </h2>
            <p style="font-size:17px; font-weight:600; text-align:center; color:#696969; font-style:italic">*Check preview for result</p>
        {/if}
    {/if} *}

    {if $display_cats == 'yes'}
        <div class="col col-12 ls-search-cat toner-by-marke-wrap">
            <div class="col col-12 container">
                {col cols=12}
                    {* <h1 class="h2">Categories here</h1> *}
                    {if $catsL2['catsL2']}
                            {row class="row-eq-height pt-cats-wrap "}
                                {foreach $catsL2['catsL2'] as $k=>$childCat2} 
                                    {assign var="childCat" value=$childCat2['cat']}
                                    {assign var='pName' value="{$childCat->getShortName()|trim}"}
                                    {assign var="idsKey" value=$childCat2['idsKey']}
                                    {if $childCat->dName}
                                        {$pName = $childCat->dName}
                                    {/if}
                                    {col cols=12 class="ls-subcat"}
                                        {* {$pName} *}
                                        {if $topCats[$idsKey] && $topCats[$idsKey]|count > 0}
                                            <div class="top-cats row-eq-height">
                                                {foreach $topCats[$idsKey] as $tCat}
                                                    {* <div class="top-cat"> *}
                                                    {link href=$tCat["url"] class="top-cat"}
                                                        <div class="title">
                                                            {$tCat["title"]}
                                                        </div>
                                                    {/link}
                                                    {* </div> *}
                                                {/foreach}
                                            </div>

                                        {/if}
                                        <div class="subcategories-image d-none- d-md-flex"> 
                                            {if $childCat->imageURL && !$childCat->imageURL|strstr:"keinBild"}
                                                {* <img src="{$childCat->imageURL}" > *}
                                                {image lazy=true webp=false
                                                    src="{$childCat->imageURL}"
                                                    alt="{$childCat->cName}"
                                                }
                                            {else}
                                                <h2 class="brand-name">{$pName}</h2>
                                            {/if}
                                        </div>
                                    {/col}
                                {/foreach}
                            {/row}
                    {/if}
                {/col}
            </div>
        </div>
    {/if}
{/row} 

 {if !$isPreview}
    <style>
    .ls-search-slider-wrap{
        min-width: 350px;
        padding: 0;
        flex: 1;
        max-width: 400px;
        margin-right: calc(60% - 400px);
    }
    .ls-search-slider .slick-slide .content-wrap {
        position: relative;
        height: 100%;
        width: 100%;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    .ls-search-slider .slick-slide .content-wrap .text-section{
        padding: 5px;
        min-width: 350px;
        width: 350;
        text-align: center;
        width: 350px;
    }
    .ls-search-slider .slick-slide .content-wrap .img-section {
        width: 0px;
        overflow: visible;
        height: 100%;
        display: flex;
        align-items: center;
        position: absolute;
        right: 0px;
    }

     .ls-slider-nav.slider-nav{
        margin-top: -70px;
        width: auto;
    }
     .ls-slider-nav.slider-nav .slick-track{
        justify-content:center;
        align-items:Center;
        max-width:100%;
    }
     .ls-slider-nav.slider-nav .slick-track .slick-active:nth-child(1),
     .ls-slider-nav.slider-nav .slick-track .slick-active:nth-child(3){
        max-width:60px;
        padding: 0px;
        text-align: center;
    }
     .ls-slider-nav.slider-nav .slick-slide{
        line-height:1;
    }
    .ls-slider-nav .slick-dots{ 
        margin:0px;
    } 
    .ls-slider-nav .next.slick-arrow,
    .ls-slider-nav .prev.slick-arrow{ 
        width: auto;
        display: inline-block;
        position: relative;
        transform: none;
        opacity: 1;
        background: transparent;
        line-height: 1;
        padding: 7px;
        top: auto;
        min-width: 40px;
        max-width:40px;
        min-height: 40px;
        cursor:pointer;
    } 
    .ls-slider-nav .next.slick-arrow:after,
    .ls-slider-nav .prev.slick-arrow:after{ 
        content: "\f104";
        display: inline-block;
        position: absolute;
        opacity: 1;
        width: 40px;
        z-index: 999;
        height: 37px;
        font-family: "Font Awesome 5 Free";
        color: #fff;
        justify-content: center;
        align-items: center;
        display: flex;
        font-weight: bold;
        font-size: 40px;
        top: 0px;
        left: 0px;
    } 
    .ls-slider-nav .next.slick-arrow:after{ 
        content: "\f105";
    } 
    .ls-slider-nav .next.slick-arrow:hover:after{ 
        animation: moveRightAndBack .7s ease forwards;
        -webkit-animation: moveRightAndBack .7s ease forwards;
        -moz-animation: moveRightAndBack .7s ease forwards;
    } 
    .ls-slider-nav .prev.slick-arrow:hover:after{ 
        animation: moveLeftAndBack .7s ease forwards;
        -webkit-animation: moveLeftAndBack .7s ease forwards;
        -moz-animation: moveLeftAndBack .7s ease forwards;
    } 
    @media (max-width: 800px){
        .ls-search-slider .slick-slide .content-wrap .img-section{
            position:relative;
        }
        .ls-search-slider .slick-slide .content-wrap .text-section{
            width:auto;
            min-width: auto;
        }
    }
       
    </style>

{inline_script}
    <script>

        function test_function(data){
            //console.log(data);
        }
        $(document).ready(function(){
            
            
    
        });
    </script>
    {/inline_script}
 {/if}


