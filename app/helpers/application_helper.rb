module ApplicationHelper

  def status_tag(id, boolean)

    # options[:true_text]  ||= ''
    # options[:false_text] ||= ''
    #
    # if boolean
    #   content_tag(:i, options[:true_text], :class => 'status-true glyphicon glyphicon-ok')
    # else
    #   content_tag(:i, options[:false_text], :class => 'status-false glyphicon glyphicon-remove')
    # end
    if boolean
    link_to("", {:action => 'update_status', :id => id, :status => 'false' }, :class => "glyphicon glyphicon-ok", :style => "color:green")
    else
      link_to("", {:action => 'update_status', :id => id, :status => 'true' }, :class => "glyphicon glyphicon-remove", :style => "color:red" )
    end

  end

  def error_messages_for(object)
    render(:partial => "application/error_messages", :locals => {:object => object})
  end

end
