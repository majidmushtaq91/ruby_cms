class PageController < ApplicationController
  def index
    @page = Page.sorted

  end

  def show
    @page = Page.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
    @page = Page.find(params[:id])

  end

  def update
    @page = Page.find(params[:id])
    @page.update_attributes(page_params)

    flash[:notice] = 'Page Updated successfully'
    redirect_to(:action => 'show', :id => @page.id)
  end

  def delete
  end

  def destroy
  end

  private
  def page_params
    params.require(:page).permit(:name, :position, :visible)
  end

end
