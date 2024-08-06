<?php declare(strict_types=1);

namespace Plugin\ls_search\Portlets\LsSearchCat; 
use JTL\OPC\InputType;
use JTL\OPC\Portlet;
use Smarty;

/**
 * Class LsSearchCat
 * @package Plugin\OPC\Portlets 
 */ 
 
class LsSearchCat extends Portlet 
{
    /**
     * 
     * @return string
     * 
     */
    public function getButtonHtml(): string{
        return '
        <i class="fas fa-search-plus" style="color:#ee3546"></i><span>LS Search</span>';
    }
	

    /**
     * @return array
     */
    public function getPropertyDesc(): array
    {
        return [
            'display_style' => [
                'label'   => \__('Display Style'),
                'type'    => InputType::RADIO,
                'options' => [
                    'vertical' => \__('vertical'),
                    'horizontal' => \__('Horizonzal'),
                ],
                'default'  => 'vertical' ,
                'width' => 25
            ],
            'default_select' => [
                'label'   => \__('Default Select'),
                'type'    => InputType::RADIO,
                'options' => [
                    'printer' => \__('Printer'),
                    'product' => \__('Product'),
                ],
                'default'  => 'no' ,
                'width' => 25
            ],
            'display_cats' => [
                'label'   => \__('Display Cats'),
                'type'    => InputType::RADIO,
                'options' => [
                    'yes' => \__('yes'),
                    'no' => \__('no'),
                ],
                'default'  => 'yes' ,
                'width' => 25
            ],
            'display_slider' => [
                'label'   => \__('Display Slider'),
                'type'    => InputType::RADIO,
                'options' => [
                    'yes' => \__('yes'),
                    'no' => \__('no'),
                ],
                'default'  => 'no' ,
                'width' => 25
            ],
			'wrap_class'   => [
                'label'   => \__('Wrap Class'),
                'type'    => InputType::TEXT,
                'default' => \__(''),
                'width'   => 50
            ],
			'default_back_color'   => [
                'label'   => \__('Default Back Color'),
                'type'    => InputType::COLOR,
                'default' => \__(''),
                'width'   => 50
            ],
            'sec_subtitle'   => [
                'label'   => \__('Subtitle'),
                'type'    => InputType::TEXT,
                'default' => \__(''),
                'width'   => 100
            ],
			'sec_title'   => [
                'label'   => \__('Title'),
                'type'    => InputType::TEXT,
                'default' => \__(''),
                'width'   => 100
            ],
			'btns_title'   => [
                'label'   => \__('Btns title'),
                'type'    => InputType::TEXT,
                'default' => \__('Search By'),
                'width'   => 100
            ],
           
			'search_by_printer_title'   => [
                'label'   => \__('search by printer Title'),
                'type'    => InputType::TEXT,
                'default' => \__('Nach Drucker suchen'),
                'width'   => 50 
            ],
			'search_by_prod_title'   => [
                'label'   => \__('search by product Title'),
                'type'    => InputType::TEXT,
                'default' => \__('Nach Produktnummer suchen'),
                'width'   => 50 
            ],
			'cat_field_label'   => [
                'label'   => \__('Manufacturer Label'),
                'type'    => InputType::TEXT,
                'default' => \__('1. Hersteller auswählen'),
                'width'   => 50 
            ],
            'cat_field_placeholder'   => [
                'label'   => \__('Manufacturer Placeholder'), 
                'type'    => InputType::TEXT,
                'default' => \__('Hersteller filtern'),
                'width'   => 50 
            ],
			'cat_field_info'   => [
                'label'   => \__('Manufacturer Info'),
                'type'    => InputType::TEXT,
                'default' => \__('Wählen Sie den Hersteller Ihres Druckers aus, um auf die passenden Produkte zugreifen zu können. '),
                'width'   => 100 
            ],
			'prod_number_label'   => [ 
                'label'   => \__('Product Nr. Label'),
                'type'    => InputType::TEXT,
                'default' => \__('2. Produktnummer auswählen'),
                'width'   => 50 
            ],
			'prod_number_placeholder'   => [ 
                'label'   => \__('Product Nr. Placeholder'),
                'type'    => InputType::TEXT,
                'default' => \__('Produktnummer filtern'),
                'width'   => 50 
            ],
            'prod_number_info'   => [ 
                'label'   => \__('Product Nr. Info'),
                'type'    => InputType::TEXT,
                'default' => \__('Wählen Sie die benötigte Produktnummer für Ihren Drucker aus'), 
                'width'   => 100 
            ],
			'modal_number_label'   => [
                'label'   => \__('Printer Model Label'),
                'type'    => InputType::TEXT,
                'default' => \__('2. Druckermodell auswählen'), 
                'width'   => 50 
            ],
			'modal_number_info'   => [
                'label'   => \__('Printer Model Info'),
                'type'    => InputType::TEXT,
                'default' => \__('Wählen Sie das Modell Ihres Druckers aus, um auf die passenden Produkte zugreifen zu können.'), 
                'width'   => 50 
            ],
			'modal_number_placeholder'   => [
                'label'   => \__('Printer Model Placeholder'),
                'type'    => InputType::TEXT,
                'default' => \__('Druckermodell filtern'), 
                'width'   => 50 
            ],
			'footer_html'   => [
                'label'   => \__('footer text (html)'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide1_title'   => [
                'label'   => \__('Title'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 60 
            ],
			'slide1_color'   => [
                'label'   => \__('Background Color'),  
                'type'    => InputType::COLOR,
                'default' => \__(''), 
                'width'   => 30
            ],
            'slide1_active' => [
                'label'   => \__('Active'),
                'type'    => InputType::RADIO,
                'options' => [
                    'yes' => \__('YES'),
                    'no' => \__('NO'),
                ],
                'default'  => 'no' ,
                'width' => 10
            ],
            'slide1_subtitle'   => [
                'label'   => \__('Subitle'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide1_text'   => [
                'label'   => \__('HTML Text'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide1_link_label'   => [
                'label'   => \__('Button Label'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide1_link'   => [
                'label'   => \__('Button Link'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50
            ],
			'slide1_link_alt'   => [
                'label'   => \__('Button Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
			'slide1_img'   => [
                'label'   => \__('Image Url'),
                'type'    => InputType::IMAGE,
                'default' => \__(''), 
                'width'   => 50 
            ],
			'slide1_img_alt'   => [
                'label'   => \__('Image Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide2_active' => [
                'label'   => \__('Active'),
                'type'    => InputType::RADIO,
                'options' => [
                    'yes' => \__('YES'),
                    'no' => \__('NO'),
                ],
                'default'  => 'no' ,
                'width' => 10
            ],
            'slide2_title'   => [
                'label'   => \__('Title'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 60 
            ],
            'slide2_color'   => [
                'label'   => \__('Background Color'),
                'type'    => InputType::COLOR,
                'default' => \__(''), 
                'width'   => 30 
            ],
            'slide2_subtitle'   => [
                'label'   => \__('Subitle'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide2_text'   => [
                'label'   => \__('HTML Text'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide2_link_label'   => [
                'label'   => \__('Button Label'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide2_link'   => [
                'label'   => \__('Button Link'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50
            ],
			'slide2_link_alt'   => [
                'label'   => \__('Button Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
			'slide2_img'   => [
                'label'   => \__('Image Url'),
                'type'    => InputType::IMAGE,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide2_img_alt'   => [
                'label'   => \__('Image Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide3_active' => [
                'label'   => \__('Active'),
                'type'    => InputType::RADIO,
                'options' => [
                    'yes' => \__('YES'),
                    'no' => \__('NO'),
                ],
                'default'  => 'no' ,
                'width' => 10
            ],
            'slide3_title'   => [
                'label'   => \__('Title'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 60 
            ],
            'slide3_color'   => [
                'label'   => \__('Background Color'),
                'type'    => InputType::COLOR,
                'default' => \__(''), 
                'width'   => 30 
            ],
            'slide3_subtitle'   => [
                'label'   => \__('Subitle'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide3_text'   => [
                'label'   => \__('HTML Text'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide3_link_label'   => [
                'label'   => \__('Button Label'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide3_link'   => [
                'label'   => \__('Button Link'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50
            ],
			'slide3_link_alt'   => [
                'label'   => \__('Button Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
			'slide3_img'   => [
                'label'   => \__('Image Url'),
                'type'    => InputType::IMAGE,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide3_img_alt'   => [
                'label'   => \__('Image Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide4_active' => [
                'label'   => \__('Active'),
                'type'    => InputType::RADIO,
                'options' => [
                    'yes' => \__('YES'),
                    'no' => \__('NO'),
                ],
                'default'  => 'no' ,
                'width' => 10
            ],
            'slide4_title'   => [
                'label'   => \__('Title'),
                'type'    => InputType::TEXT, 
                'default' => \__(''), 
                'width'   => 60 
            ],
            'slide4_color'   => [
                'label'   => \__('Background Color'),
                'type'    => InputType::COLOR,
                'default' => \__(''), 
                'width'   => 30 
            ],
            'slide4_subtitle'   => [
                'label'   => \__('Subitle'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide4_text'   => [
                'label'   => \__('HTML Text'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide4_link_label'   => [
                'label'   => \__('Button Label'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide4_link'   => [
                'label'   => \__('Button Link'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50
            ],
			'slide4_link_alt'   => [
                'label'   => \__('Button Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
			'slide4_img'   => [
                'label'   => \__('Image Url'),
                'type'    => InputType::IMAGE,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide4_img_alt'   => [
                'label'   => \__('Image Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide5_active' => [
                'label'   => \__('Active'),
                'type'    => InputType::RADIO,
                'options' => [
                    'yes' => \__('YES'),
                    'no' => \__('NO'),
                ],
                'default'  => 'no' ,
                'width' => 10
            ],
            'slide5_title'   => [
                'label'   => \__('Title'),
                'type'    => InputType::TEXT, 
                'default' => \__(''), 
                'width'   => 60 
            ],
            'slide5_color'   => [
                'label'   => \__('Background Color'),
                'type'    => InputType::COLOR,
                'default' => \__(''), 
                'width'   => 30 
            ],
            'slide5_subtitle'   => [
                'label'   => \__('Subitle'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide5_text'   => [
                'label'   => \__('HTML Text'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide5_link_label'   => [
                'label'   => \__('Button Label'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide5_link'   => [
                'label'   => \__('Button Link'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50
            ],
			'slide5_link_alt'   => [
                'label'   => \__('Button Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
			'slide5_img'   => [
                'label'   => \__('Image Url'),
                'type'    => InputType::IMAGE,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide5_img_alt'   => [
                'label'   => \__('Image Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide6_active' => [
                'label'   => \__('Active'),
                'type'    => InputType::RADIO,
                'options' => [
                    'yes' => \__('YES'),
                    'no' => \__('NO'),
                ],
                'default'  => 'no' ,
                'width' => 10
            ],
            'slide6_title'   => [
                'label'   => \__('Title'),
                'type'    => InputType::TEXT, 
                'default' => \__(''), 
                'width'   => 60 
            ],
            'slide6_color'   => [
                'label'   => \__('Background Color'),
                'type'    => InputType::COLOR,
                'default' => \__(''), 
                'width'   => 30 
            ],
            'slide6_subtitle'   => [
                'label'   => \__('Subitle'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide6_text'   => [
                'label'   => \__('HTML Text'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide6_link_label'   => [
                'label'   => \__('Button Label'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide6_link'   => [
                'label'   => \__('Button Link'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50
            ],
			'slide6_link_alt'   => [
                'label'   => \__('Button Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
			'slide6_img'   => [
                'label'   => \__('Image Url'),
                'type'    => InputType::IMAGE,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide6_img_alt'   => [
                'label'   => \__('Image Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide7_active' => [
                'label'   => \__('Active'),
                'type'    => InputType::RADIO,
                'options' => [
                    'yes' => \__('YES'),
                    'no' => \__('NO'),
                ],
                'default'  => 'no' ,
                'width' => 10
            ],
            'slide7_title'   => [
                'label'   => \__('Title'),
                'type'    => InputType::TEXT, 
                'default' => \__(''), 
                'width'   => 60 
            ],
            'slide7_color'   => [
                'label'   => \__('Background Color'),
                'type'    => InputType::COLOR,
                'default' => \__(''), 
                'width'   => 30 
            ],
            'slide7_subtitle'   => [
                'label'   => \__('Subitle'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide7_text'   => [
                'label'   => \__('HTML Text'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide7_link_label'   => [
                'label'   => \__('Button Label'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide7_link'   => [
                'label'   => \__('Button Link'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50
            ],
			'slide7_link_alt'   => [
                'label'   => \__('Button Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
			'slide7_img'   => [
                'label'   => \__('Image Url'),
                'type'    => InputType::IMAGE,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide7_img_alt'   => [
                'label'   => \__('Image Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide8_active' => [
                'label'   => \__('Active'),
                'type'    => InputType::RADIO,
                'options' => [
                    'yes' => \__('YES'),
                    'no' => \__('NO'),
                ],
                'default'  => 'no' ,
                'width' => 10
            ],
            'slide8_title'   => [
                'label'   => \__('Title'),
                'type'    => InputType::TEXT, 
                'default' => \__(''), 
                'width'   => 60 
            ],
            'slide8_color'   => [
                'label'   => \__('Background Color'),
                'type'    => InputType::COLOR,
                'default' => \__(''), 
                'width'   => 30 
            ],
            'slide8_subtitle'   => [
                'label'   => \__('Subitle'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide8_text'   => [
                'label'   => \__('HTML Text'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 100 
            ],
			'slide8_link_label'   => [
                'label'   => \__('Button Label'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide8_link'   => [
                'label'   => \__('Button Link'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50
            ],
			'slide8_link_alt'   => [
                'label'   => \__('Button Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ],
			'slide8_img'   => [
                'label'   => \__('Image Url'),
                'type'    => InputType::IMAGE,
                'default' => \__(''), 
                'width'   => 50 
            ],
            'slide8_img_alt'   => [
                'label'   => \__('Image Alt'),
                'type'    => InputType::TEXT,
                'default' => \__(''), 
                'width'   => 50 
            ]
            
        ];
    }

    /**
     * @return array
     */
    public function getPropertyTabs(): array
    {
        return [
            'Slide 1'=> ['slide1_title','slide1_color', 'slide1_active','slide1_subtitle','slide1_text', 'slide1_link', 'slide1_link_label', 'slide1_link_alt', 'slide1_img', 'slide1_img_alt'],
            'Slide 2'=> ['slide2_title','slide2_color','slide2_active','slide2_subtitle','slide2_text', 'slide2_link', 'slide2_link_label', 'slide2_link_alt', 'slide2_img', 'slide2_img_alt'],
            'Slide 3'=> ['slide3_title','slide3_color','slide3_active','slide3_subtitle','slide3_text', 'slide3_link', 'slide3_link_label', 'slide3_link_alt', 'slide3_img', 'slide3_img_alt'],
            'Slide 4'=> ['slide4_title','slide4_color','slide4_active','slide4_subtitle','slide4_text', 'slide4_link', 'slide4_link_label', 'slide4_link_alt', 'slide4_img', 'slide4_img_alt'],
            'Slide 5'=> ['slide5_title','slide5_color','slide5_active','slide5_subtitle','slide5_text', 'slide5_link', 'slide5_link_label', 'slide5_link_alt', 'slide5_img', 'slide5_img_alt'],
            'Slide 6'=> ['slide6_title','slide6_color','slide6_active','slide6_subtitle','slide6_text', 'slide6_link', 'slide6_link_label', 'slide6_link_alt', 'slide6_img', 'slide6_img_alt'],
            'Slide 7'=> ['slide7_title','slide7_color','slide7_active','slide7_subtitle','slide7_text', 'slide7_link', 'slide7_link_label', 'slide7_link_alt', 'slide7_img', 'slide7_img_alt'],
            'Slide 8'=> ['slide8_title','slide8_color','slide8_active','slide8_subtitle','slide8_text', 'slide8_link', 'slide8_link_label', 'slide8_link_alt', 'slide8_img', 'slide8_img_alt'], 
            \__('Styles')    => 'styles',
            \__('Animation') => 'animations',
        ];
    }
}
