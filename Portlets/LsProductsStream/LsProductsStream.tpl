{*
pos::imageurl::link||linkLabel::text::style<imgleft/imgright/imgcenter/imgtop/imgbottom>
3::/media/image/ls/oven.png::https://regal-gastro.shop-template.de/||28% Rduziert::Getränkekühl::imgleft
*}
{if $isPreview}
    {$data=['portlet' => $instance->getDataAttribute()]} 
{/if}
{row data=$data|default:null 
class=$instance->getAnimationClass()|cat:' '|cat:$instance->getStyleClasses() 
style=$instance->getStyleString() }
    {assign 'title' $instance->getProperty('title')}
    {assign 'description' $instance->getProperty('description')}
    {assign 'max_products' $instance->getProperty('max_products')|intval} 
    {assign 'sort_order' $instance->getProperty('sort_order')}
    {assign 'crosssellCatA' $instance->getProperty('crosssellingA')}
    {assign 'cross_selling' $instance->getProperty('cross_selling')}
    {assign 'list_style' $instance->getProperty('list_style')}
    {assign 'default_text' $instance->getProperty('default_text')}
    {assign 'products_type' $instance->getProperty('products_type')|intval} 
     {assign 'slide_count' $instance->getProperty('slide_count')|intval} 

    {assign 'view_type' $instance->getProperty('view_type')} 

   {if $view_type =='gallery'}
    {col cols="12" class=" ls-products-steam las-new-products-portlet {$view_type}"}
        <div class="custom-portlet-wrap" >
            {* DISPLAY TITLE *}
            {if !empty($title)}<div class="title-wrap">{$title}</div>{/if}
            {* DISPLAY DESCRIPTION *}
            {if !empty($description)}<div class="title-wrap">{$description}</div>{/if} 
            
            {* CROSSELLING DATA *}
            {assign 'prodCount' value=0}
            {assign 'crossSellPos' value=array()}
            {assign 'crossSellPosData' value=array()}

            {if is_array($crosssellCatA) && count($crosssellCatA) > 0}
                {foreach from=$crosssellCatA item=item }
                    {if !empty($item)}
                        {assign 'tempA' value= '::'|explode:$item}
                        {$temp = array_push($crossSellPos,$tempA[0])}
                        {$temp = array_push($crossSellPosData,$tempA)}
                    {/if}
                {/foreach}
            {/if}
            {if !$isPreview}

                {assign "crossSellData" value= array()}
                {if $cross_selling && $cross_selling|count > 0}
                    {foreach $instance->getProperty('cross_selling') as $i => $slide}
                        {if !empty($slide.url)}
                            {assign "titleA" value= '||'|explode:$slide.title}
                            {assign "desc" value=$slide.desc}
                            {assign "link" value=$slide.link}
                            {$imgAttribs = $instance->getImageAttributes($slide.url, $slide.alt, $slide.title)}
                            {assign "arrKey" value=$titleA[0]}
                            {if $arrKey && !$crossSellData[$arrKey]}
                                {$crossSellData[$arrKey] = ["titleA"=>$titleA, "desc"=>$desc, "imgAttribs"=>$imgAttribs, "link"=>$link]}
                            {/if}
                        {/if}
                    {/foreach}
                {/if}
                        {* <pre>{$crossSellData|print_r}</pre> *}
                
                {if $max_products > 0}
                    {get_product_list  nLimit=$max_products kSuchspecial=$products_type nSortierung=10  cAssign="newProducts"} 
                {else}
                    {get_product_list   kSuchspecial=$products_type nSortierung=10  cAssign="newProducts"} 
                {/if}
                {if is_array($newProducts) && count($newProducts) > 0}
                   {* {$newProducts|count} *}
                    {assign 'columnsA' value=array_column($newProducts, 'dErstellt')}
                    {if $sort_order == 'asc'}
                        {assign 'dataSorted' value=array_multisort($columnsA, SORT_ASC, $newProducts)}
                    {else}
                        {assign 'dataSorted' value=array_multisort($columnsA, SORT_DESC, $newProducts)} 
                    {/if}
            
                    {* product list row *}
                    {row class="pt-6 ls-products-row row gallery row-eq-height row-eq-img-height layout-{$list_style} product-list opc-ProductStream opc-ProductStream-gallery" id="product-list"  itemprop="mainEntity" itemscope=true itemtype="https://schema.org/ItemList"}  
                     {assign "countProd" value=0}
                        {foreach $newProducts as $Artikel} 
                            {$countProd = $countProd +1}
                            {assign "clsC" value ="col product-wrapper mb-4  col-12 col-sm-6 col-md-4 col-lg-4 col-xl-3"}
                            {assign "cls" value ="col product-wrapper mb-4 col-sm-6 col-md-3 col-lg-3 col-xl-3 col-12"}
                            {if is_array($crossSellData) && $crossSellData|count > 0}
                                {if $crossSellData[$countProd]}
                                
                                    {assign "cSlide" value=$crossSellData[$countProd]}
                                    {$clsC ="col product-wrapper mb-4  col-12 col-sm-6 col-md-6 col-lg-6 col-xl-6"} 

                                    {col class="{$clsC} c-col-{$countProd}"
                                        itemprop="itemListElement" itemscope=true itemtype="https://schema.org/Product"} 
                                        <div class="incat-crosssel-wrap {$cSlide["titleA"][2]}">
                                            <div class="content-wrap">
                                                <div class="ls-content row justify-content-center">
                                                    <div class="img-wrap">
                                                        {image
                                                        srcset=$cSlide["imgAttribs"].srcset
                                                        sizes=$cSlide["imgAttribs"].srcsizes
                                                        src=$cSlide["imgAttribs"].src
                                                        alt=$cSlide["imgAttribs"].alt|escape:'html'
                                                        title=$cSlide["titleA"][1]|escape:'html'
                                                        data=['desc' => $cSlide["desc"]|escape:'html']}
                                                    </div>
                                                    <div class="text-wrap ta-center">
                                                        <h3 class="sec-title md ta-center d-block w-10">{$cSlide["titleA"][1]}</h3>
                                                        <p class="sec-desc ta-center d-block w-10">{$cSlide["desc"]}</p> 

                                                        <a class="btn-primary has-gfx" style="margin:0.5rem auto" href="{$cSlide["link"]}" title="{$cSlide["titleA"][1]|escape:'html'}">{$cSlide["imgAttribs"].alt}</a>   
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    {/col}
                                {/if}
                            {/if}
                             
                  
                             {col class="{$cls}" 
                                itemprop="itemListElement" itemscope=true itemtype="https://schema.org/Product"}
                                {if $list_style === 'list'}
                                    {include file='productlist/item_list.tpl' tplscope=$list_style isOPC=true}
                                {elseif $list_style === 'gallery'}
                                    {include file='productlist/item_box.tpl' tplscope=$list_style class='thumbnail'} 

                                {/if}
                            {/col}
                            
                        {/foreach}
                    {/row}
                    
                {else}
                    <div class="ls-default-text-wrap">
                        <div class="ls-content">
                            {$default_text} 
                        </div>
                    </div>
                {/if}
            {else}
            <div class="opc-ProductStream" style="{$instance->getStyleString()}">
                {image alt='ProductStream' src=$portlet->getBaseUrl()|cat:'preview-'|cat:$list_style|cat:'.png' style="position:relative; display:inline-block; width:100%; height:auto;"}
            </div>
            {/if} {* if not preview ends *}

            {* PRODUCTS *}
            {* {get_product_list  nLimit=15 kSuchspecial=3 nSortierung=10  cAssign="newProducts"}   *}
            
        </div>
    {/col}
        {/if}

    {if $view_type =='slider'}

        {if $isPreview}
           <div class="opc-ProductStream" style="{$instance->getStyleString()}">
                {image alt='ProductStream' src=$portlet->getBaseUrl()|cat:'preview-'|cat:$list_style|cat:'.png' style="position:relative; display:inline-block; width:100%; height:auto;"}
            </div>
          {else}
                {if $max_products > 0}
                    {get_product_list  nLimit=$max_products kSuchspecial=$products_type nSortierung=10  cAssign="newProducts"} 
                {else}
                   {get_product_list   kSuchspecial=$products_type nSortierung=10  cAssign="newProducts"} 
                  {/if}
                {assign "slidecls" value ="col lscustomslider"}
                <div class="{$slidecls}" data-count="{$slide_count}" silder-name="lscustomslider_{$slide_count}">
                        {foreach $newProducts as $Artikel} 
                            {col class="{$cls}" 
                                itemprop="itemListElement" itemscope=true itemtype="https://schema.org/Product"}
                                {if $list_style === 'list'}
                                    {include file='productlist/item_list.tpl' tplscope=$list_style isOPC=true}
                                {elseif $list_style === 'gallery'}
                                    {include file='productlist/item_box.tpl' tplscope=$list_style class='thumbnail'} 
                                {/if}
                            {/col} 
                        {/foreach}
                </div>                 
	    {/if}
    {/if}
{/row} 





