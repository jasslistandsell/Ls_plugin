<?php declare(strict_types=1);

namespace Plugin\ls_plugin\Portlets\Categories;

use JTL\OPC\InputType;
use JTL\OPC\Portlet;

/**
 * Class Categories
 * @package Plugin\OPC\Portlets
 */ 
 
class Categories extends Portlet
{
    /**
     * 
     * @return string
     * 
     */
    public function getButtonHtml(): string{
        return '<i class="fas fa-hamburger" style="color:#ff2a40;"></i> <span>Categories</span>';
    }
	

    /**
     * @return array
     */
    public function getPropertyDesc(): array
    {
        return [
            'sec_title' => [
                'label'   => \__('Title'),
                'type'    => InputType::TEXT,
                'default'  => 'Title' ,
                'width' => 90
            ],

            'data_type' => [ 
                'label'   => \__('Data type'),
                'type'    => InputType::RADIO,
                'options' => [
                    'categories' => \__('Categories'),
                ],
                'default'  => 'categories' ,
                'width' => 30
            ],

            'with_desc' => [
                'label'   => \__('Show With Desc'),
                'type'    => InputType::RADIO,
                'options' => [
                    'yes' => \__('Yes'),
                    'no' => \__('No'),
                ],
                'default'  => 'no' ,
                'width' => 30
            ],
            'display_type' => [
                'label'   => \__('View type'),
                'type'    => InputType::RADIO,
                'options' => [
                    'gallery' => \__('Gallery'),
                    'slider' => \__('Slider'),
                ],
                'default'  => 'slider' ,
                'width' => 30
            ],

            'toggle_height' => [
                'label'   => \__('Toggle height'),
                'type'    => InputType::NUMBER,
                'default'  => 150 ,
                'desc' => 'toggle height for sub categories content data from this height to show more data',
                'width' => 30
            ],
            'custom_data_width' => [
                'label'   => \__('Slide Width'),
                'type'    => InputType::NUMBER,
                'default'  => 150 ,
                'desc' => 'custom data element width',
                'width' => 30
            ],
            'max_char' => [
                'label'   => \__('Desc Max Characters'),
                'type'    => InputType::NUMBER,
                'default'  => 100 ,
                'width' => 30
            ],
			'sec_desc' => [
                'label'   => \__('Description'),
                'type'    => InputType::TEXT,
                'width' => 90,
                'default'  => 'Descritpion' , 
            ],
			'cat_ids'   => [
                'label'   => \__('Category ID'),
                'type'    => InputType::TEXT_LIST, 
                'desc' => 'if Data type is Categories: enter Cat id, sub categories : enter cat ID, Custom Data:  add custom html text',
                'width'   => 90  
            ],

			'sec_btn_label'   => [
                'label'   => \__('Button Label'),
                'type'    => InputType::TEXT, 
                'width'   => 40  
            ],
            'sec_btn_class'   => [
                'label'   => \__('Button Class'), 
                'type'    => InputType::TEXT, 
                'width'   => 40 
            ],
			'sec_btn_url'   => [
                'label'   => \__('Button  URL'), 
                'type'    => InputType::TEXT, 
                'width'   => 90  
            ],
			
            
        ];
    }

    /**
     * @return array
     */
    public function getPropertyTabs(): array
    {
        return [
            'Section Settings'=> ['data_type', 'display_type', 'with_desc','toggle_height','custom_data_width', 'max_char','sec_title','sec_desc','cat_ids'],
            \__('Styles')    => 'styles',
            \__('Animation') => 'animations',
        ];
    }
 

    
}