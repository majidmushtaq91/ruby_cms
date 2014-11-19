module ApplicationHelper

  def status_tag(boolean, options={})

    options[:true_text]  ||= ''
    options[:false_text] ||= ''

    if boolean
      content_tag(:i, options[:true_text], :class => 'status-true glyphicon glyphicon-ok')
    else
      content_tag(:i, options[:false_text], :class => 'status-false glyphicon glyphicon-remove')
    end

  end

end
