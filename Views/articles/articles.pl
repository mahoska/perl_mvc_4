
$articles = '';

foreach $arg(@data)
{
    $articles.= '<div class="panel panel-info">';
    $articles .='<div class="panel-heading">';
    $articles .='<h3 class="panel-title">'.$arg->{'title'}.'</h3>';
    $articles .='</div>';
    $articles .='<div class="panel-body">';
    $articles .= '<div>'.$arg->{'content'}.'</div>';
    $articles .= '<div class="clearfix">';
    $articles .= '<div class="left-column">'.$arg->{'date'}.'</div>';
    $articles .= '<div class="right-column">'.$arg->{'login'}.'</div>';
    $articles .= '</div>';
    $articles .= '</div>';
    $articles .= '</div>';
};

$content =<<HTML;
$articles
HTML

return 1;



