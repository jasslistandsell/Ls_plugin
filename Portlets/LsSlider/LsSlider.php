<?php declare(strict_types=1);

namespace Plugin\ls_plugin\Portlets\LsSlider; 

use JTL\OPC\InputType;
use JTL\OPC\Portlet;
use JTL\OPC\PortletInstance;

/**
 * Class LsSlider
 * @package JTL\OPC\Portlets
 */
class LsSlider extends Portlet
{

    /**
     * 
     * @return string
     * 
     */
    public function getButtonHtml(): string{
        return '
        <svg xmlns="http://www.w3.org/2000/svg" width="66.157" height="21" viewBox="0 0 66.157 21">
            <g id="Icon-Slider" transform="translate(-14.5 -27.152)">
                <path id="Path_246" fill="#ee3546" data-name="Path 246" d="M-16.01-6.3l-4.059,4.1,4.059,4.1a.477.477,0,0,1,.145.348.477.477,0,0,1-.145.348l-1.269,1.282a.468.468,0,0,1-.344.147.468.468,0,0,1-.344-.147l-5.672-5.731a.477.477,0,0,1-.145-.348.477.477,0,0,1,.145-.348l5.672-5.731a.468.468,0,0,1,.344-.147.468.468,0,0,1,.344.147L-16.01-7a.477.477,0,0,1,.145.348A.477.477,0,0,1-16.01-6.3ZM41.228-1.854,35.556,3.877a.477.477,0,0,1-.688,0L33.6,2.595a.488.488,0,0,1,0-.7l4.059-4.1L33.6-6.3a.477.477,0,0,1-.145-.348A.477.477,0,0,1,33.6-7L34.868-8.28a.468.468,0,0,1,.344-.147.468.468,0,0,1,.344.147l5.672,5.731a.477.477,0,0,1,.145.348A.477.477,0,0,1,41.228-1.854Z" transform="translate(38.784 39.783)"  stroke="rgba(0,0,0,0)" stroke-width="1"></path>
                <path id="Path_845" fill="#ee3546" data-name="Path 845" d="M11.375-21a2.531,2.531,0,0,1,1.859.766A2.531,2.531,0,0,1,14-18.375v15.75a2.531,2.531,0,0,1-.766,1.859A2.531,2.531,0,0,1,11.375,0h-22.75a2.531,2.531,0,0,1-1.859-.766A2.531,2.531,0,0,1-14-2.625v-15.75a2.531,2.531,0,0,1,.766-1.859A2.531,2.531,0,0,1-11.375-21ZM11.047-2.625a.315.315,0,0,0,.219-.109.315.315,0,0,0,.109-.219V-18.047a.315.315,0,0,0-.109-.219.315.315,0,0,0-.219-.109H-11.047a.315.315,0,0,0-.219.109.315.315,0,0,0-.109.219V-2.953a.315.315,0,0,0,.109.219.315.315,0,0,0,.219.109ZM-7-16.187a2.117,2.117,0,0,1,1.559.629A2.117,2.117,0,0,1-4.812-14a2.117,2.117,0,0,1-.629,1.559A2.117,2.117,0,0,1-7-11.812a2.117,2.117,0,0,1-1.559-.629A2.117,2.117,0,0,1-9.187-14a2.117,2.117,0,0,1,.629-1.559A2.117,2.117,0,0,1-7-16.187ZM-8.75-5.25V-7.875l2.188-2.187a.591.591,0,0,1,.438-.164.591.591,0,0,1,.438.164L-3.5-7.875l6.563-6.562A.591.591,0,0,1,3.5-14.6a.591.591,0,0,1,.438.164L8.75-9.625V-5.25Z" transform="translate(48.371 48.152)"></path>
            </g>
            </svg><span>LS Slider</span>';
    }

    /**
     * @return array
     */
    public function getPropertyDesc(): array
    {
        $desc = [
            'slider-theme'                => [
                'label'      => \__('Theme'),
                'type'       => InputType::SELECT,
                'options'    => [
                    'default' => \__('themeStandard'),
                ],
                'width' => 24,
            ],
            'slider-animation-speed'      => [
                'label'      => \__('animationSpeed'),
                'type'       => InputType::NUMBER,
                'default'    => 1500,
                'width'      => 24,
            ],
            'slider-animation-pause'      => [
                'label'      => \__('pause'),
                'type'       => InputType::NUMBER,
                'default'    => 6000,
                'width'      => 24,
            ],
            'default_back_color'   => [
                'label'   => \__('backgroundColor'),
                'type'    => InputType::COLOR,
                'default' => \__(''),
                'width'   => 24
            ],
            'slider-start'                => [
                'label'      => \__('autoStart'),
                'type'       => InputType::RADIO,
                'options'    => [
                    'true'  => \__('yes'),
                    'false' => \__('no'),
                ],
                'default'    => 'true',
                'inline'     => true,
                'width'      => 25,
            ],
            'slider-pause'                => [
                'label'      => \__('pauseOnHover'),
                'type'       => InputType::RADIO,
                'options'    => [
                    'true'  => \__('pauseOnHoverPause'),
                    'false' => \__('pauseOnHoverContinue'),
                ],
                'default'    => 'false',
                'width'      => 25,
            ],
            'slider-navigation'           => [
                'label'      => \__('pointNavigation'),
                'type'       => InputType::RADIO,
                'options'    => [
                    'true'  => \__('yes'),
                    'false' => \__('no'),
                ],
                'default'    => 'false',
                'width'      => 25,
            ],
            
            'slides'                      => [
                'label'      => \__('images'),
                'type'       => InputType::IMAGE_SET, 
                'default'    => [],
                'useLinks'   => true,
                'useTitles'  => true,
            ],
        ];

        return $desc;
    }

    /**
     * @return array
     */
    public function getPropertyTabs(): array
    {
        return [
            \__('Slides') => ['slides'],
            \__('Styles') => 'styles',
        ];
    }
}
