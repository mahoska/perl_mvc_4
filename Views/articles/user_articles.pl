my $list = '<ul class="list-group">';
foreach $key(keys %$articles)
{
    $list.='<a href="">';
    $list.='<li class="list-group-item list-group-item-info article_title">';
    $list.= $articles->{'title'};
    $list.='</li>';
    $list.='</a>';
}
$list .= '</ul>';

$content = <<HTML;
<div class="articles-list">
    <div class="col-sm-12 col-md-12">
        <div class="thumbnail category-item">
            <div class="caption">
                $list
            </div>
        </div>
    </div>
</div>
HTML

return 1;
