{if $isPreview}
    {$slides = $instance->getProperty('slides')}
    {if $slides|count > 0}
        {$imgAttribs = $instance->getImageAttributes($slides[0].url, $slides[0].alt, $slides[0].title)}
    {/if}
    <div class="text-center opc-ImageSlider {if $slides|count > 0}opc-ImageSlider-with-image{/if}"
         style="{if $slides|count > 0}background-image: url('{$imgAttribs.src}');{/if} {$instance->getStyleString()}">
        <div>
            {file_get_contents($portlet->getBasePath()|cat:'icon.svg')} 
            <span>{__('Bilder-Slider')}</span>
        </div>
    </div>
{else}
    {$uid = $instance->getUid()}
    {$slides = $instance->getProperty('slides')}
    {$default_back_color = $instance->getProperty('default_back_color')}   
    <div class="full-container slider-container fade-in ptb-4 {$instance->getStyleClasses()}" style="animation-name: fadeIn; {$instance->getStyleString()} {if $default_back_color} background-color: {$default_back_color} {/if}">
        <div class="container" style="position:relative; width:100%;">
            {if $instance->getProperty('slides')|count > 0}
                <div class="ls-search-slider " style="width:100%;">
                        {foreach $instance->getProperty('slides') as $i => $slide}

                            {if !empty($slide.url)}
                                {$imgAttribs = $instance->getImageAttributes($slide.url, $slide.alt, $slide.title)}
                                <div class="slide-{$i}" backcolor="{$slide_color}">
                                    <div class="content-wrap row justify-content-space-between align-item-center" style="">
                                        <div class="text-section col-12 col-sm-12 col-md-7 col-lg-7 col-xl-7 row align-items-center justify-content-center">
                                            <div>
                                                <h2>{$slide.title}</h2>
                                                <h3>{$slide.desc}</h3>
                                                {if !empty($slide.link)}
                                                    <a href="{$slide.link}" class="has-gfx"
                                                    
                                                        {if !empty($slide.title)}title="{$slide.title|escape:'html'}"{/if}
                                                        >
                                                        <span class="label">{$imgAttribs.alt}</span> 
                                                    </a>
                                                {/if}
                                            </div>
                                        </div>

                                        <div class="img-section col-12 col-sm-12 col-md-5 col-lg-5 col-xl-5 row align-items-center justify-content-center">
                                            <div style="width:100%">
                                                {assign "imgsize" value= getimagesize("{$imgAttribs.src}")}
                                                {assign "w" value=400}
                                                {assign "h" value=400}
                                                {if is_array($imgsize) && isset($imgsize[0]) && isset($imgsize[1])}
                                                    {* {$w=$imgsize[0]} *}
                                                    {* {$h=$imgsize[1]} *}
                                                    {$w=$imgsize[0]/($imgsize[1]/$h)}
                                                {/if}
                                                {image
                                                    webp=true
                                                    srcset=$imgAttribs.srcset
                                                    sizes="(max-width: 767px) 300px, (max-width: 991px) 300px, (max-width: 1299px) 400px, (min-width: 1300px) 400px, 400px"
                                                    src=$imgAttribs.src
                                                    alt=$imgAttribs.alt|escape:'html'
                                                    title=$slideTitle|escape:'html'
                                                    data=['desc' => $slide.desc|escape:'html']
                                                    width="{$w}"
                                                    height="{$h}"
                                                    }
                                                    
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            {/if}

                        {/foreach}
                </div>
                <div class="slider-nav ls-slider-nav">
                    <div class="prev slick-arrow">Prev</div>
                    <div id="mainSlider__dots1" class="slick-dots-append"></div> 
                    <div class="next slick-arrow">Next</div>
                </div>
            {/if}
        </div>
    </div>
{/if}