       {assign 'title' $instance->getProperty('title')}
    {assign 'description' $instance->getProperty('description')}
   <h2>{$title}</h2>
    <p>{$description}</p>
    <section class="index-news-wrapper">
    <div class="backgrund-ovrly">
      {container fluid=true class="{if $Einstellungen.template.theme.left_sidebar === 'Y' && $boxesLeftActive}container-plus-sidebar{/if}"}
          {block name='page-index-subheading-news'}
              <div class="blog-header">
                  <div class="hr-sect h2">
                  <h2>{lang key='blog_title'}</h2>
                     {*
                      {link href="{get_static_route id='news.php'}"}{lang key='news' section='news'}{/link}
                      *}
                  </div>
                  <h5 class="contnt-blog">{lang key='blog_content'}</h5>
              </div>
          {/block}
          {block name='page-index-news'}
              {row itemprop="about"
                   itemscope=true
                   itemtype="https://schema.org/Blog"
                   class="slick-smooth-loading carousel carousel-arrows-inside slick-lazy slick-type-news {if $oNews_arr|count < 3}slider-no-preview{/if}"
                   data=["slick-type"=>"news-slider"]}
                  {include file='snippets/slider_items.tpl' items=$oNews_arr type='news'}
              {/row}
          {/block}
      {/container}
  </section>

