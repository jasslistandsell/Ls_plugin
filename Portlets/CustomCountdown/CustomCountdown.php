<?php declare(strict_types=1);

namespace Plugin\ls_plugin\Portlets\CustomCountdown;

use JTL\OPC\InputType; 
use JTL\OPC\Portlet;

/**
 * Class CustomCountdown
 * @package Plugin\OPC\Portlets
 */ 
class CustomCountdown extends Portlet
{
    /**
     * @return string
     */
    // public function getButtonHtml(): string
    // {
    //     return '<span color="#EE3546">'.$this->getFontAwesomeButtonHtml('far fa-calendar-alt').'<span>Custom Code</span></span>';
    // }
    public function getButtonHtml(): string{
        return '
        <i class="far fa-stopwatch" style="color:#ee3546; font-weight:bold"></i> 
        </svg> <span>LS Countdown</span>'; 
    }

    /**
     * @return array
     */
    public function getPropertyDesc(): array
    {
        return [
            'until'        => [
                'label'    => __('Countdown Date Time'),
                'type'     => InputType::DATETIME,
                'required' => true,
                'width' => 40
            ],
            'counterType' => [
                'label'   => \__('Type'),
                'type'    => InputType::RADIO,
                'options' => [
                    'until-counter' => \__('Once'),
                    'weekly-counter' => \__('Weekly'),
                    'daily-counter' => \__('Daily'),
                ],
                'default'  => 'until-counter' ,
                'width' => 60
            ],
            'expired-text' => [
                'label' => __('textAfterCountdownFinished'),
                'type'  => InputType::RICHTEXT,
            ],
        ];
    }

    /**
     * @return array
     */
    public function getPropertyTabs(): array
    {
        return [
            __('Styles')    => 'styles',
            __('Animation') => 'animations',
        ];
    }
}
