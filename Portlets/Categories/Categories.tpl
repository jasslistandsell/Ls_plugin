{*
language variables
showAll, showLess
*}
{if $isPreview}
    {$data=['portlet' => $instance->getDataAttribute()]} 
{/if}
{row data=null 
class=$instance->getAnimationClass()|cat:' '|cat:$instance->getStyleClasses()
style=$instance->getStyleString() }

    {assign 'data_type' $instance->getProperty('data_type')}
    {assign 'toggle_height' $instance->getProperty('toggle_height')}
    {assign 'custom_data_width' $instance->getProperty('custom_data_width')}

    {if intVal($toggle_height) <= 0}
        {$toggle_height = 150}
    {/if}
    {if intVal($custom_data_width) <= 0}
        {$custom_data_width = 150}
    {/if}

    {if $instance->getProperty('sec_title')}
        {assign 'cls'  'las-cats-sec-title'}

        {if $data_type == "custom"}
            {$cls = ''}
        {/if}
        {col cols=12 class="{$cls}"}
            <h2 class="h2 sec-title">{$instance->getProperty('sec_title')}</h2>  
        {/col} 
    {/if}
    {if $instance->getProperty('sec_desc')} 
        {col cols=12 class="las-cats-sec-desc"}
            <p class="sec-desc">{$instance->getProperty('sec_desc')}</p>  
        {/col} 
    {/if}

    {assign 'withDesc' $instance->getProperty('with_desc')}
    {assign 'max_char' $instance->getProperty('max_char')} 
    
    {if $max_char <= 0 }
        {assign 'max_char' 100} 
    {/if}

    {assign 'display_type' $instance->getProperty('display_type')}
    

    {* if data type == categories *}
    {if $data_type == 'categories'}
        {* IF NOT SLIDER *}
        {if $display_type == 'gallery'}
            {* IF WITHOUT DESCRIPTION *}
            {if !empty($instance->getProperty('cat_ids')) && $withDesc == 'no'}
                {col cols="12"  class="las-cats-wrap" }
                    {get_category_array categoryId=0 assign='categories'}
                    {if !empty($categories)}
                        {foreach $instance->getProperty('cat_ids') as $catId}
                            {if intVal($catId) > 0} 
                                {foreach $categories as $category}
                                    {if $category->getID() == $catId}                           
                                        <div class="las-cat-wrap">
                                            {link href="{$category->getUrl()}" title="{$category->getName()}"}
                                                {if !empty(trim($category->getImage()))}
                                                    <div class="img-wrap">
                                                        <img src="{$category->getImage()}" srcset="https://sparsando.de/media/image/icons/sparsando-icon.svg" 
                                                            data-srcset="{$category->getImage()}" class="lazyload img-fluid" 
                                                        >
                                                    </div>
                                                {/if}
                                                <h4 class="las-cat-name" cat-id="{$category->getID()}">{$category->getShortName()}</h4> 
                                            {/link}
                                        </div>
                                    {/if}
                                {/foreach}
                            {/if}
                        {/foreach}
                    {/if}
                {/col} 
            {/if}

            {* IF WITHOUT DESCRIPTION *}
            {if !empty($instance->getProperty('cat_ids')) && $withDesc == 'yes'}
                {col cols="12"  class="las-cats-wrap" }
                    {get_category_array categoryId=0 assign='categories'}
                    {if !empty($categories)}
                        {foreach $instance->getProperty('cat_ids') as $catId}
                            {if intVal($catId) > 0} 
                                {foreach $categories as $category}
                                    {if $category->getID() == $catId}                           
                                        <div class="las-cat-wrap has-desc"> 
                                            {link href="{$category->getUrl()}" title="{$category->getName()}"}
                                                {if !empty(trim($category->getImage()))}
                                                    <div class="img-wrap">
                                                        {* <img src="{$category->getImage()}"> *}
                                                        <img src="{$category->getImage()}" srcset="https://sparsando.de/media/image/icons/sparsando-icon.svg" 
                                                            data-srcset="{$category->getImage()}" class="lazyload img-fluid"
                                                        >
                                                    </div>
                                                {/if}
                                                {/link}
                                                <h4 class="las-cat-name" cat-id="{$category->getID()}">{$category->getShortName()}</h4>
                                                
                                                {if $category->getDescription()|count_characters > 0}
                                                    <p class="las-cat-desc" cat-id="{$category->getID()}">
                                                        {$category->getDescription()|truncate:{$max_char}:""} 
                                                        {if $category->getDescription()|count_characters >= {$max_char}} 
                                                            {link href="{$category->getUrl()}" title="{$category->getName()}"}
                                                                mehr...
                                                            {/link} 
                                                        {else}
                                                            {link href="{$category->getUrl()}" title="{$category->getName()}"}
                                                                mehr...
                                                            {/link} 
                                                        {/if}
                                                    </p>
                                                {else}
                                                    <p class="las-cat-desc" cat-id="{$category->getID()}">
                                                        {link href="{$category->getUrl()}" title="{$category->getName()}"}
                                                                mehr...
                                                        {/link} 
                                                    </p>
                                                {/if}
                                        </div>
                                    {/if}
                                {/foreach}
                            {/if}
                        {/foreach}
                    {/if}
                {/col} 
            {/if}
        {/if}

        {if $display_type == 'slider'}

         {if $isPreview}
           <div class="opc-ProductStream" style="{$instance->getStyleString()}">
            {image alt='ProductStream' src=$portlet->getBaseUrl()|cat:'preview-'|cat:$display_type|cat:'.png' style="position:relative; display:inline-block; width:100%; height:auto;"}
            </div>
          {else}
            {block name="ls-categories-list"}
           {if $nSeitenTyp != $smarty.const.PAGE_BESTELLVORGANG}
        {assign "maxCats" value=8}
        {get_category_array categoryId=0 assign='categories'}
        {* {$categories|print_r} *}
        {if !empty($categories)}
            <div class="container-fluid no-padding">
                <div class="ls-cat-slider back-primary-light-">
                    {foreach $categories as $category}
                        {if $maxCats <= 0}
                            {break}
                        {/if}
                        {$maxCats = $maxCats -1}
                        <div class="slider-content cat-wrap">
                            {link href=$category->getURL()
                                title=$category->getName()|escape:'html'
                                class=""
                                target="_self"
                                data=["category-id"=>$category->getID()]}
                                <div class="img-wrap  custom-slides">
                                {*
                                    {include file='snippets/image.tpl'
                                            class='submenu-headline-image'
                                            item=$category
                                            square=false
                                            srcSize='lg'
                                            alt="{if empty($imgAlt->cWert)}{$category->getName()|escape:'html'}{else}{$imgAlt->cWert}{/if}"}*}
                                          <img src="{$category->getImage(\JTL\Media\Image::SIZE_MD)}"  alt="{if empty($imgAlt->cWert)}{$category->getName()|escape:'html'}{else}{$imgAlt->cWert}{/if}"> 
                                </div>
                                <div class="text-wrap">
                                    <h3 class="sec-title sm fc-primary">
                                    <span class="nav-mobile-heading">{$category->getShortName()}
                                    </span></h3>
                                </div>
                            {/link}
                        </div>
                        {* {if $category->hasChildren()}
                            {foreach $category->getChildren() as $childCategory}
                                <div class="slider-content cat-wrap">
                                    {link href=$childCategory->getURL()
                                        title=$childCategory->getName()|escape:'html'
                                        class=""
                                        target="_self"
                                        data=["category-id"=>$childCategory->getID()]}
                                        <div class="img-wrap">
                                            {include file='snippets/image.tpl'
                                                    class='submenu-headline-image'
                                                    item=$childCategory
                                                    square=false
                                                    srcSize='sm'
                                                    alt="{if empty($imgAlt->cWert)}{$childCategory->getName()|escape:'html'}{else}{$imgAlt->cWert}{/if}"}
                                        </div>
                                        <div class="text-wrap">
                                            <h3 class="sec-title sm fc-primary">
                                            <span class="nav-mobile-heading">{$childCategory->getShortName()}
                                            </span></h3>
                                        </div>
                                    {/link}
                                </div>
                            {/foreach}
                        {/if}  *}
                    {/foreach} 
                </div>
            </div>
        {/if}
      {/if}
      {/block}                
	            {/if}

        {/if}
        {/if}
{/row} 



