class SectionController < ApplicationController
  layout("admin")

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])

  end

  def new
    @section_count = Section.count + 1
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
    redirect_to(:action => 'show', :id => @section.id)
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
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
