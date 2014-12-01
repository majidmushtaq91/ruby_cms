class SectionController < ApplicationController
  layout("admin")

  before_action :confirm_logged_in

  def index
    @sections = Section.sorted
  end

  def show
    @section = Section.find(params[:id])

  end

  def new
    @section = Section.new
    @section_count = Section.count + 1
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:notice] = 'Page created !'
      redirect_to(:action => 'index')
    else
      @section_count = Section.count + 1
      render('new')
    end
  end

  def edit
    @section = Section.find(params[:id])
    @section_count = Section.count
  end

  def update
    @section = Section.find(params[:id])
   # @section_count = Section.count

    if @section.update_attributes(section_params)
      flash[:notice] = "Section Updated"
      redirect_to(:action => 'show', :id => @section.id)
    else
      @section_count = Section.count + 1
      render('edit')
    end
  end


  def delete
    @section = Section.find(params[:id])
  end

  def destroy
    @section = Section.find(params[:id]).destroy
    flash[:notice] = "Section Removed Success !!"
    redirect_to(:action => 'index')
  end

  def update_status
    @section = Section.find(params[:id])
    if params[:status] == 'true'

      @section.update_attributes(:visible => '1')
    end
    if params[:status] == 'false'
      @section.update_attributes(:visible => '0')
    end

    flash[:notice] = 'Section Updated successfully'
    redirect_to(:action => 'index', :id => @section.id)
  end

  private
  def section_params
    params.require(:section).permit(:name, :position, :page_id, :visible, :content_type, :content)
  end
end
