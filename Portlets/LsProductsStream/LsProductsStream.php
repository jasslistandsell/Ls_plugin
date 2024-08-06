<?php declare(strict_types=1);

namespace Plugin\ls_plugin\Portlets\LsProductsStream;

use JTL\OPC\InputType;
use JTL\OPC\Portlet;
use Smarty;

/**
 * Class LsProductsStream
 * @package Plugin\OPC\Portlets
 */ 
 
class LsProductsStream extends Portlet
{
    /**
     * 
     * @return string
     * 
     */
    public function getButtonHtml(): string{
        return '
        <svg version="1.1" id="Layer_1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
                viewBox="0 0 85.3 37.3" style="enable-background:new 0 0 85.3 37.3;" xml:space="preserve">
            <g id="Icon-Product-Stream" transform="translate(-3.258 -2.917)">
                <g id="Path_848">
                    <path class="st0" fill="#EE3546" d="M13.6,13.8l2.6-1.9l2.6,1.9l-1,3h-3.2L13.6,13.8z M13.1,7.1c1-0.4,2-0.6,3.1-0.6c1.1,0,2.1,0.2,3.1,0.6
                        c1,0.4,1.8,1,2.6,1.7c0.7,0.7,1.3,1.6,1.7,2.6c0.4,1,0.6,2,0.6,3.1c0,1.1-0.2,2.1-0.6,3.1c-0.4,1-1,1.8-1.7,2.6
                        c-0.7,0.7-1.6,1.3-2.6,1.7c-1,0.4-2,0.6-3.1,0.6c-1.1,0-2.1-0.2-3.1-0.6c-1-0.4-1.8-1-2.6-1.7c-0.7-0.7-1.3-1.6-1.7-2.6
                        c-0.4-1-0.6-2-0.6-3.1c0-1.1,0.2-2.1,0.6-3.1c0.4-1,1-1.8,1.7-2.6C11.2,8.1,12.1,7.5,13.1,7.1z M21.7,18.5
                        c0.9-1.2,1.3-2.6,1.3-4.1v0l-0.9,0.8l-2.1-2l0.6-2.9l1.2,0.1c-0.9-1.2-2.1-2.1-3.5-2.5l0.5,1.1l-2.6,1.4l-2.6-1.4L14.1,8
                        c-1.4,0.4-2.6,1.3-3.5,2.5l1.2-0.1l0.6,2.9l-2.1,2l-0.9-0.8v0c0,1.5,0.5,2.9,1.3,4.1l0.3-1.2l2.9,0.4l1.2,2.7L14,21
                        c0.7,0.2,1.4,0.3,2.1,0.3c0.7,0,1.5-0.1,2.1-0.3l-1-0.6l1.2-2.7l2.9-0.4L21.7,18.5z"/>
                </g>
                <g id="Path_852">
                    <path class="st0" fill="#EE3546" d="M7.8,26.5h18c0.6,0,1,0.6,1,1.4s-0.5,1.4-1,1.4c0,0,0,0,0,0h-18c-0.6,0-1-0.6-1-1.4
                        C6.7,27.1,7.2,26.5,7.8,26.5z"/>
                </g>
                <g id="Path_850">
                    <path class="st0" fill="#EE3546" d="M12.6,31h7.9c0.3,0,0.6,0.6,0.6,1.4c0,0.8-0.3,1.4-0.6,1.4h-7.9c-0.3,0-0.6-0.6-0.6-1.4
                        C12,31.7,12.3,31,12.6,31z"/>
                </g>
                <g>
                    <path class="st1" fill="#EE3546" d="M27.3,38H6.3C5.1,38,4,37,4,35.7V7.4C4,6.1,5.1,5,6.3,5h20.9c1.3,0,2.3,1,2.3,2.3v28.3
                        C29.6,37,28.6,38,27.3,38z M6.3,5.5c-1,0-1.8,0.8-1.8,1.8v28.3c0,1,0.8,1.8,1.8,1.8h20.9c1,0,1.8-0.8,1.8-1.8V7.4
                        c0-1-0.8-1.8-1.8-1.8H6.3z"/>
                </g>
            </g>
            <g>
                <g id="Path_847">
                    <path class="st0" fill="#EE3546" d="M73.3,17.5c-0.3-1.8-0.8-3.5-1.5-5.2h0l0,0l-0.4,0.2c-0.2,0.1-0.5,0.2-1.1,0.5c-0.5,0.3-1,0.5-1.4,0.9
                        c-0.5,0.4-1,0.8-1.4,1.2c-0.4,0.4-0.8,1-1.1,1.5l-0.2-0.1c1.2,1,2.8,1.6,4.4,1.6C71.5,18.1,72.5,17.9,73.3,17.5z M71.4,11.2
                        c-0.1-0.3-0.3-0.7-0.6-1.2c-2.3,0.7-4.6,1-7,1c0,0.1,0,0.1,0,0.2c0,0.8,0.2,1.7,0.5,2.5c0.3,0.8,0.7,1.5,1.3,2.1
                        c0.4-0.6,0.8-1.2,1.3-1.7c0.4-0.5,0.9-0.9,1.5-1.3c0.5-0.3,0.9-0.6,1.4-0.8c0.3-0.2,0.7-0.4,1-0.5l0.4-0.1l0.1,0
                        C71.3,11.2,71.3,11.2,71.4,11.2z M70.3,9c-0.8-1.4-1.6-2.7-2.5-3.9c-1,0.4-1.8,1.1-2.4,1.9c-0.7,0.8-1.1,1.8-1.3,2.8
                        C66.1,9.8,68.2,9.5,70.3,9L70.3,9z M77.4,12.3c-1.4-0.4-2.8-0.5-4.3-0.3c0.6,1.6,1,3.2,1.3,4.9c0.8-0.5,1.4-1.2,1.9-2
                        C76.9,14.1,77.2,13.2,77.4,12.3z M69,4.6C69,4.6,69,4.6,69,4.6C69,4.6,69,4.6,69,4.6L69,4.6z M75.1,6.1c-1.2-1.1-2.8-1.7-4.5-1.7
                        c-0.5,0-1.1,0.1-1.6,0.2c1,1.3,1.8,2.6,2.6,4c0.5-0.2,0.9-0.4,1.3-0.6c0.3-0.2,0.7-0.4,1-0.6c0.2-0.2,0.5-0.4,0.7-0.6
                        c0.1-0.1,0.3-0.3,0.4-0.4L75.1,6.1z M77.5,11.2c0-1.6-0.6-3.1-1.6-4.3l0,0c-0.1,0.1-0.1,0.2-0.2,0.3c-0.1,0.2-0.3,0.3-0.5,0.5
                        C75,7.8,74.8,8,74.5,8.2c-0.3,0.2-0.7,0.5-1,0.7c-0.4,0.3-0.9,0.5-1.4,0.7c0.2,0.4,0.3,0.7,0.5,1c0,0,0,0.1,0.1,0.2
                        c0,0.1,0,0.1,0.1,0.2c0.3,0,0.5-0.1,0.8-0.1c0.3,0,0.5,0,0.8,0c0.2,0,0.5,0,0.7,0c0.2,0,0.5,0,0.7,0c0.2,0,0.4,0,0.6,0.1
                        c0.2,0,0.4,0,0.5,0.1l0.4,0.1c0.1,0,0.2,0,0.3,0L77.5,11.2z M77.6,7.2c0.7,1.2,1.1,2.6,1.1,4c0,1.4-0.4,2.8-1.1,4
                        c-0.7,1.2-1.7,2.2-2.9,2.9c-1.2,0.7-2.6,1.1-4,1.1c-1.4,0-2.8-0.4-4-1.1c-1.2-0.7-2.2-1.7-2.9-2.9c-0.7-1.2-1.1-2.6-1.1-4
                        c0-1.4,0.4-2.8,1.1-4C64.4,6,65.4,5,66.6,4.3c1.2-0.7,2.6-1.1,4-1.1c1.4,0,2.8,0.4,4,1.1C75.9,5,76.9,6,77.6,7.2z"/>
                </g>
                <g id="Path_852_00000155866216406066253360000004693795014340553405_">
                    <path class="st0" fill="#EE3546" d="M62,23.6h18c0.6,0,1,0.6,1,1.4s-0.5,1.4-1,1.4c0,0,0,0,0,0H62c-0.6,0-1-0.6-1-1.4C61,24.2,61.4,23.6,62,23.6z
                        "/>
                </g>
                <g id="Path_850_00000076565171006774488290000011202415507023009440_">
                    <path class="st0" fill="#EE3546" d="M66.8,28.1h7.9c0.3,0,0.6,0.6,0.6,1.4c0,0.8-0.3,1.4-0.6,1.4h-7.9c-0.3,0-0.6-0.6-0.6-1.4
                        C66.2,28.7,66.5,28.1,66.8,28.1z"/>
                </g>
                <g>
                    <path class="st1" fill="#EE3546" d="M81.6,35.1H60c-1.3,0-2.3-1-2.3-2.3V4.4c0-1.3,1-2.3,2.3-2.3h21.6c1.3,0,2.3,1,2.3,2.3v28.3
                        C83.9,34.1,82.9,35.1,81.6,35.1z M60,2.6c-1,0-1.8,0.8-1.8,1.8v28.3c0,1,0.8,1.8,1.8,1.8h21.6c1,0,1.8-0.8,1.8-1.8V4.4
                        c0-1-0.8-1.8-1.8-1.8H60z"/>
                </g>
            </g>
            <g>
                <path class="st0" fill="#EE3546" d="M50.8,2.7h-18c-1.5,0-2.7,1.2-2.7,2.7v26.3c0,1.5,1.2,2.7,2.7,2.7h18c1.5,0,2.7-1.2,2.7-2.7V5.4
                    C53.5,3.9,52.3,2.7,50.8,2.7z M46.6,11.7c0.1-0.1,0.2-0.1,0.3,0c0.2,0.1,0.5,0.4,0.6,0.7c0.2,0.3,0.3,0.9,0.3,1.1
                    c0,0.5-0.3,1.3-0.7,1.7c-0.3,0.3-0.4,0.3-0.7,0c-0.6-0.6-0.9-1.4-0.7-2.1C45.9,12.5,46.3,11.8,46.6,11.7z M39.5,19.4
                    c0.3-0.1,0.8-0.1,1.1,0c0.3,0.1,0.8,0.4,0.9,0.6c0.1,0.1,0.1,0.2,0,0.3c-0.1,0.2-0.4,0.4-0.7,0.6c-0.6,0.3-1.2,0.3-1.8-0.2
                    c-0.2-0.2-0.5-0.4-0.5-0.5C38.5,20,39.1,19.6,39.5,19.4z M37,15.7c0-0.3,0.7-0.7,1.2-0.8c0.1,0,0.3-0.1,0.3-0.1c0,0,0.1,0,0.3,0
                    c0.2,0,0.4,0.1,0.6,0.2c0.3,0.2,0.7,0.5,0.7,0.6c0,0.1-0.3,0.4-0.6,0.6c-0.3,0.2-0.7,0.3-0.9,0.3C38,16.5,37,16,37,15.7z
                    M40.5,12.4c0.1-0.6,0.5-1.2,0.9-1.7c0.1-0.1,0.3-0.2,0.3-0.3c0.1,0,0.1,0,0.2,0c0.2,0.1,0.5,0.4,0.7,0.7c0.7,1,0.8,1.9,0.3,2.9
                    c-0.3,0.6-0.8,1.2-1.1,1.2c-0.1,0-0.5-0.4-0.8-0.8c-0.3-0.5-0.5-0.9-0.6-1.3C40.4,12.8,40.4,12.7,40.5,12.4z M40.8,18.5
                    c-0.2-0.7,0.1-1.5,0.7-2.1c0.3-0.3,0.4-0.3,0.7,0c0.4,0.4,0.7,1.2,0.7,1.7c0,0.7-0.7,1.9-1.1,1.9C41.5,19.9,40.9,19.1,40.8,18.5z
                    M43,19.4c0.1,0,0.3-0.1,0.5-0.1c0.3,0,0.4,0,0.7,0.2c0.3,0.2,0.8,0.6,0.8,0.7c0,0.2-0.5,0.6-1,0.8c-0.4,0.1-0.8,0.1-1.2-0.1
                    c-0.4-0.2-0.8-0.5-0.8-0.7C42,20,42.5,19.6,43,19.4z M44.8,16.5c-0.5-0.1-1-0.4-1.2-0.7c-0.1-0.1-0.1-0.1,0-0.2
                    c0.2-0.3,0.8-0.6,1.2-0.7c0.1,0,0.2,0,0.2,0c0,0,0.6,0.1,0.8,0.2c0.3,0.1,0.7,0.4,0.8,0.6l0.1,0.1l-0.3,0.2
                    C45.9,16.4,45.3,16.6,44.8,16.5z M45.1,9.4c0.4,0.2,0.8,0.6,0.8,0.7c0,0.1-0.3,0.5-0.6,0.7c-0.7,0.4-1.3,0.5-2,0.3
                    c-0.4-0.2-0.9-0.5-1.1-0.7C42,10.1,42,10,42.3,9.8c0.3-0.3,0.6-0.5,1-0.6C43.9,8.9,44.5,9,45.1,9.4z M40.4,7.1
                    c0.1-0.6,0.5-1.4,1-1.8c0.3-0.3,0.4-0.3,0.8,0.1c0.7,0.7,1.1,1.8,0.9,2.6c-0.2,0.8-1,2-1.4,1.9c-0.2,0-0.5-0.4-0.8-0.7
                    C40.5,8.4,40.3,7.7,40.4,7.1z M39.1,9.1c0.5-0.2,1.2,0,1.7,0.3c0.3,0.2,0.7,0.6,0.7,0.7c0.1,0.3-0.8,0.9-1.5,1.1
                    c-0.5,0.1-1.1,0-1.7-0.4c-0.3-0.2-0.6-0.5-0.6-0.7C37.7,9.8,38.5,9.3,39.1,9.1z M35.8,13.1c0.1-0.6,0.6-1.2,0.9-1.4
                    c0.1-0.1,0.2-0.1,0.3,0c0.5,0.2,1,1.2,1,1.9c0,0.5-0.3,1.2-0.7,1.6c-0.3,0.3-0.4,0.3-0.7,0C35.9,14.6,35.6,13.7,35.8,13.1z
                    M34.8,16.5c-0.6-0.1-1.3-0.7-1.2-0.9c0.1-0.3,0.8-0.7,1.3-0.8c0.3,0,0.5,0,0.9,0.1c0.3,0.1,0.8,0.5,0.9,0.7l0.1,0.1l-0.3,0.2
                    C35.9,16.4,35.3,16.6,34.8,16.5z M35.7,17.8c0-0.5,0.3-1.2,0.7-1.6c0.1-0.2,0.3-0.3,0.4-0.3c0.1,0,0.6,0.5,0.8,0.9
                    c0.5,0.9,0.4,1.6-0.3,2.5c-0.2,0.3-0.5,0.5-0.6,0.4c-0.2,0-0.6-0.6-0.7-0.9C35.8,18.5,35.7,18,35.7,17.8z M46.9,25.6
                    c-0.1,1.4-0.2,3-0.3,3.5c-0.1,1.4-0.3,1.9-0.9,2.6c-0.4,0.4-0.9,0.7-1.5,0.8c-0.4,0.1-4.2,0.2-4.9,0.1c-1-0.2-1.7-0.6-2.1-1.5
                    c-0.2-0.5-0.3-0.9-0.4-1.7c0-0.6-0.1-2.1-0.4-5.3c0-0.5-0.1-1,0-1.1c0.1-0.4,0.4-0.8,0.8-0.9c0.2,0,1.2-0.1,4.5-0.1
                    c3.8,0,4.3,0,4.5,0.1c0.3,0.1,0.6,0.3,0.7,0.7l0.1,0.3L46.9,25.6z M47.8,18.3c-0.2,0.7-0.8,1.5-1.1,1.4c-0.2,0-0.6-0.5-0.7-0.9
                    c-0.3-0.6-0.4-1.1-0.2-1.7c0.2-0.4,0.4-0.8,0.7-1.1c0.1-0.1,0.2-0.2,0.3-0.2c0.1,0,0.6,0.6,0.8,0.9C47.9,17.3,47.9,17.8,47.8,18.3z
                    M49.3,16.3c-0.4,0.2-0.8,0.3-1.1,0.2c-0.5-0.1-1.2-0.6-1.2-0.9s0.7-0.7,1.2-0.8c0.1,0,0.3-0.1,0.3-0.1c0,0,0.1,0,0.3,0
                    c0.2,0,0.4,0.1,0.6,0.2c0.3,0.2,0.7,0.5,0.7,0.6C50,15.8,49.7,16.1,49.3,16.3z"/>
            </g>
            </svg>

            <span>LS Product Strem</span>';
    }
	

    /**
     * @return array
     */
    public function getPropertyDesc(): array
    {
        return [
            'products_type'   => [
                'label'   => \__('Products Type'),
                'type'    => InputType::SELECT,
                'options' => [
                    '1' => \__('Bestseller'),
                    '2' => \__('Sonderangebote'),
                    '3' => \__('Neu im Sortiment'),
                    '4' => \__('Top Angebote'),
                    '5' => \__('In Kürze verfügbar'),
                ],
                'default'  => '3' ,
                'width' => 30 
            ],
            'sort_order'   => [
                'label'   => \__('Order'),
                'type'    => InputType::SELECT,
                'options' => [
                    'desc' => \__('DESC'),
                    'asc' => \__('ASC'),
                ],
                'default'  => 'desc' ,
                'width' => 20
            ],
            'max_products'   => [
                'label'   => \__('Max Products'),
                'type'    => InputType::NUMBER,
                'default'  => '10' ,
                'width' => 25
            ],

            'view_type'   => [
                'label'   => \__('View'),
                'type'    => InputType::RADIO,
                'options' => [
                    'gallery' => \__('Gallery'),
                    'slider' => \__('Slider'),
                ],
                'default'  => 'gallery' ,
                'width' => 25 
            ],
            'list_style'   => [
                'label'   => \__('View'),
                'type'    => InputType::HIDDEN,
                'options' => [
                    'gallery' => \__('Gallery'),
                ],
                'default'  => 'gallery' ,
                'width' => 25 
            ],
            'slide_count'   => [
                'label'   => \__('Slide-count'),
                'type'    => InputType::NUMBER,
                'default' => \__(''),
                'desc'=>'choose Nu,mber of product  slide to show ', 
                'width'   => 25 
            ],
			'title'   => [
                'label'   => \__('Title'),
                'type'    => InputType::TEXT,
                'default' => \__(''),
                'desc'=>'some desc about the field', 
                'width'   => 100 
            ],
			'description'   => [
                'label'   => \__('Description'),
                'type'    => InputType::TEXT,
                'default' => \__(''),
                'width'   => 100 
            ],
			'default_text'   => [
                'label'   => \__('Default Text'),
                'type'    => InputType::TEXT,
                'default' => \__(''),
                'desc'    => 'This text will show when there are no products in selected category',
                'width'   => 100 
            ],
			'crHinT'   => [ 
                'label'   => \__('Hint'),
                'type'    => InputType::HINT, 
                'width'   => 100,
                'text'    => "<b>Name format</b>: pos || name || style (eg: 3||product name||imgleft)<i>styles: imgleft/imgright/imgcenter/imgtop/imgbottom </i>,  <br> <b>Alternative text</b>: will also be used as link text", 
            ],
			'crosssellingA'   => [ 
                'label'   => \__('Crosseling'),
                'type'    => InputType::TEXT_LIST, 
                'width'   => 100,
                'desc'=>'some desc about the field',   
            ],
            'cross_selling'                      => [
                'label'      => \__('Cross Selling'),
                'type'       => InputType::IMAGE_SET, 
                'default'    => [],
                'desc'    => 'Format title->  Pos::title (z.B: 3::Product Name)', 
                'useLinks'   => true,
                'useTitles'  => true,
            ],
            
        ];
    }

    /**
     * @return array
     */
    public function getPropertyTabs(): array
    {
        return [
            'Cross Selling'=> ['crHinT', 'cross_selling', 'crosssellingA'], 
            \__('Styles')    => 'styles',
            \__('Animation') => 'animations',
        ];
    }

}