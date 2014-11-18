class SectionController < ApplicationController
  layout("admin")

  def index
    @section = Section.sorted


  end

  def show
    @section = Section.find(params[:id])

  end

  def new
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = 'Page created !'
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def update
    @section = Section.find(params[:id])
    @section.update_attributes(section_params)
    flash[:notice] = "Section Updated"
    redirect_to(:action => 'index')
  end

  def edit
    @section = Section.find(params[:id])
  end

  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id]).destroy
    flash[:notice] = "Section Removed Success !!"
    redirect_to(:action => 'index')
  end


  private
  def section_params
    params.require(:section).permit(:name, :position, :page_id, :visible, :content_type, :content)
  end
end
