module ArticlesHelper
  def display_articles(collection = {})
    if collection.blank?
      html = content_tag(:div, class: 'col-sm-12 col-lg-12') do
        concat("There are no items")
      end
    else
      html =   collection.collect {|article|  content_tag(:div, class: 'panel') do
        concat(content_tag(:div, class: 'panel-heading') do
          concat(content_tag(:div, class: 'text-center') do
            concat(content_tag(:div, class: 'row') do
              concat(content_tag(:div, class: 'col-sm-9') do
                concat(content_tag(:h3, class: 'pull-left') do
                  concat(article.title)
                end)
              end)
              concat(content_tag(:div, class: 'col-sm-3') do
                concat(content_tag(:h3, class: 'pull-right') do
                  concat(content_tag(:small) do
                    concat(content_tag(:em) do
                      concat(article.created_at)
                    end)
                  end)
                end)
              end)
            end)
          end)
        end)
        concat(content_tag(:div, class: 'panel-body') do
          concat(content_tag(:p,class: 'short-text') do
            concat(article.body)
          end)
          if user_signed_in?
            if article.can_edit(current_user)
              concat( link_to('Read more ...', article , class: 'card-link'))

            end
            if article.can_edit(current_user)
              concat( link_to('Edit ', edit_article_path(article) , class: 'card-link'))
            end
            concat( link_to('Delete', article, method: :delete, data: { confirm: 'Are you sure?' }, class: 'card-link'))
            if  current_user.admin?
            end
          end
        end)
        concat(content_tag(:div, class: 'panel-footer') do
          concat(content_tag(:span, class: 'label label-default')do
          concat(article.title)
        end)
        concat(content_tag(:span, class: 'label label-default')do
        concat('Updates')
      end)
      concat(content_tag(:span, class: 'label label-default')do
      concat(article.updated_at)
    end)
  end)
  end
}.join().html_safe
end
html
end
end
