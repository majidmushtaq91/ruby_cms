class PageController < ApplicationController
  layout("admin")

  def index
    @page = Page.sorted

  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @subjects = Subject.order("position ASC")
    @page_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)
    @page.save
    flash[:notice] = 'Page created successfully !'
    redirect_to(:action => 'index')
  end

  def edit
    @page = Page.find(params[:id])
    @subjects = Subject.order("position ASC")
    @page_count = Page.count

  end

  def update
    @page = Page.find(params[:id])
    @page.update_attributes(page_params)

    flash[:notice] = 'Page Updated successfully'
    redirect_to(:action => 'show', :id => @page.id)
  end

  def update_status
    @page = Page.find(params[:id])
    if params[:status] == 'true'

      @page.update_attributes(:visible => '1')
    end
    if params[:status] == 'false'
      @page.update_attributes(:visible => '0')
    end

    flash[:notice] = 'Page Updated successfully'
    redirect_to(:action => 'index', :id => @page.id)
  end

  def delete
    @page = Page.find(params[:id])

  end

  def destroy
    page = Page.find(params[:id]).destroy
    flash[:notice] = "Page has been remove '#{page.name}'"
    redirect_to(:action => 'index')
  end

  private
  def page_params
    params.require(:page).permit(:name, :position, :visible, :subject_id)
  end

end
