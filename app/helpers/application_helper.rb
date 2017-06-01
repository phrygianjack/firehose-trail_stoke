module ApplicationHelper
  def nice_box_tag(&block)
    content = capture(&block)
     content_tag(:div, content, class: 'offset-1 col-10 col-sm-8 offset-sm-2 col-md-6 offset-md-3')
  end
end
