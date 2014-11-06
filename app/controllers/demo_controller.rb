class DemoController < ApplicationController

  layout false
  def index
    #render(:template => 'demo/index')
    #render('demo/index')
    @id = params['id']
    @page = params[:page]
    @type = params[:type]
  end

  def hello
    #render(:template => 'demo/index')
    @array = [1,2,3,4,5]
    @majid = 'Hi, this is a instance variable set from controller !'
    #render('demo/hello')
  end

  def majid
    render(:template => 'layouts/new_page')

  end

  def other_hello
    redirect_to(:controller => 'demo', :action => 'index')
  end

  def google
    redirect_to("http://google.com")
  end
end
