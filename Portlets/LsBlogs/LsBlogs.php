<?php declare(strict_types=1);

namespace Plugin\ls_plugin\Portlets\LsBlogs;

use JTL\OPC\InputType;
use JTL\OPC\Portlet;
use Smarty; // Import Smarty class
use News; // Import the News class if it's in a different namespace

class LsBlogs extends Portlet
{
    public function getLatestNews($limit = 5)
    {
        $news = new News();
        $latestNews = $news->getLatestNews();

        // Pass data to the template without rendering here
        $this->setTemplateVar('newsArticles', $latestNews);
    }

    public function render()
    {
        // Render the template when needed
        $this->display('LsBlogs.tpl');
    }

    public function getPropertyDesc(): array
    {
        $desc = [
            'title' => [
                'label' => \__('Title'),
                'type' => InputType::TEXT,
                'default' => \__(''),
                'desc' => 'some desc about the field',
                'width' => 100,
            ],
            'description' => [
                'label' => \__('Description'),
                'type' => InputType::RICHTEXT,
                'default' => \__(''),
                'width' => 100,
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
            __('Styles') => 'styles',
            __('Animation') => 'animations',
        ];
    }
}
