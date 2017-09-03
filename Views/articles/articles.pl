$articles = '';

foreach $arg(@data)
{
    $articles.= <<HTML;
        <div class="panel panel-info">
            <div class="panel-heading">
                <h3 class="panel-title">$arg->{'title'}</h3>
            </div>
            <div class="panel-body">
                <div>$arg->{'content'}</div>
                <div class="clearfix columns">
                    <div class="left-column">$arg->{'date'}</div>
                    <div class="right-column">$arg->{'login'}</div>
                </div>
            </div>
        </div>
HTML
};

$content =<<HTML;
$articles
HTML

return 1;



