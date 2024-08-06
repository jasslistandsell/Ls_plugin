{$uid = $instance->getUid()}

<div id="{$uid}"
     class="opc-Countdown {$instance->getProperty('counterType')} {$instance->getAnimationClass()} {$instance->getStyleClasses()}"
     style="{$instance->getStyleString()}"
     {$instance->getAnimationDataAttributeString()} 
>
    <div class="opc-area" {if $isPreview}data-area-id="cntdwn-title"{/if}>
        {if $isPreview}
            {$instance->getSubareaPreviewHtml('cntdwn-title')}
        {else}
            {$instance->getSubareaFinalHtml('cntdwn-title')}
        {/if}
    </div>
    {row class='text-center cntdwn-row'}
        {col cols=2 class='days col-count'}
            <div class="count-wrap">
                <div class="cntdwn-item">0</div>
                <div class="cntdwn-unit">{if $isPreview}{__('days')}{else}{lang key='days'}{/if}</div>
            </div>
        {/col}
        {col cols=2 class='hours col-count'}
            <div class="count-wrap">
                <div class="cntdwn-item">0</div>
                <div class="cntdwn-unit">{if $isPreview}{__('hours')}{else}{lang key='hours'}{/if}</div>
            </div>
        {/col}
        {col cols=2 class='minutes col-count'}
            <div class="count-wrap">
                <div class="cntdwn-item">0</div>
                <div class="cntdwn-unit">{if $isPreview}{__('minutes')}{else}{lang key='minutes'}{/if}</div>
            </div>
        {/col}
        {*
        {col cols=2 class='seconds col-count'}
            <div class="count-wrap">
                <div class="cntdwn-item">0</div>
                <div class="cntdwn-unit">{if $isPreview}{__('seconds')}{else}{lang key='seconds'}{/if}</div>
            </div>
        {/col}
        *}
        {col cols=12 class='expired'}
            {$instance->getProperty('expired-text')}
        {/col}
    {/row}
    <div class="opc-area" {if $isPreview}data-area-id="cntdwn-footer"{/if}>
        {if $isPreview}
            {$instance->getSubareaPreviewHtml('cntdwn-footer')}
        {else}
            {$instance->getSubareaFinalHtml('cntdwn-footer')}
        {/if}
    </div>
    {* daily-sale *}
    {* weekly-sale *}


    {inline_script}
        <script>
            $(() => {

                // UNTILL COUNTER
                var sel_date = "{$instance->getProperty('until')}";
                let until = new Date(sel_date.replace(/-/g, "/"));
                let countDownDate = until.getTime();
                let timeout = setInterval(update, 1000);

                if($(document).find(".until-counter#{$uid}").length > 0){
                    update();
                    $(window).trigger('resize');
                }

                function update()
                {
                    let now      = new Date().getTime();
                    let distance = countDownDate - now;
                    let days     = Math.floor(distance / (1000 * 60 * 60 * 24));
                    let hours    = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                    let minutes  = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                    let seconds  = Math.floor((distance % (1000 * 60)) / 1000);

                    if (distance <= 0) {
                        clearInterval(timeout);
                        days    = 0;
                        hours   = 0;
                        minutes = 0;
                        seconds = 0;
                        $("#{$uid} .expired").show();
                        $(window).trigger('resize');
                    }

                    $(".until-counter#{$uid} .days .cntdwn-item").html(days);
                    $(".until-counter#{$uid} .hours .cntdwn-item").html(hours);
                    $(".until-counter#{$uid} .minutes .cntdwn-item").html(minutes);
                    $(".until-counter#{$uid} .seconds .cntdwn-item").html(seconds);
                }

                // WEEKLY COUNTER
                if($(document).find(".daily-counter#{$uid}").length > 0){
                    setInterval(function time(){
                        var d = new Date();
                        var hours = 24 - d.getHours();
                        var min = 60 - d.getMinutes();
                        if((min + '').length == 1){
                            min = '0' + min;
                        }
                        var sec = 60 - d.getSeconds();
                        if((sec + '').length == 1){
                                sec = '0' + sec;
                        }
                        jQuery(".daily-counter#{$uid} .days .cntdwn-item").html("0");
                        jQuery(".daily-counter#{$uid} .hours .cntdwn-item").html(hours);
                        jQuery(".daily-counter#{$uid} .minutes .cntdwn-item").html(min);
                        jQuery(".daily-counter#{$uid} .seconds .cntdwn-item").html(sec);
                        
                    }, 1000);
                }

                // WEEKLY COUNTER
                if($(document).find(".weekly-counter#{$uid}").length > 0){
                    setInterval(function time(){   
                        var d = new Date();
                        var days = 7 - d.getDay();
                        var hours = 24 - d.getHours();
                        var min = 60 - d.getMinutes();
                        if((min + '').length == 1){
                            min = '0' + min;
                        }
                        if(days == 7){
                            days = 0;
                        }
                        var sec = 60 - d.getSeconds();
                        if((sec + '').length == 1){
                                sec = '0' + sec;
                        }
                        jQuery(".weekly-counter#{$uid} .days .cntdwn-item").html(days);
                        jQuery(".weekly-counter#{$uid} .hours .cntdwn-item").html(hours);
                        jQuery(".weekly-counter#{$uid} .minutes .cntdwn-item").html(min);
                        jQuery(".weekly-counter#{$uid} .seconds .cntdwn-item").html(sec); 
                        
                    }, 1000);
                }
            }); 
        </script>
    {/inline_script}
</div>
