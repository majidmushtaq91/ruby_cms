class SubjectsController < ApplicationController
  layout("admin")

  def index
    @subjects = Subject.sorted
  end

  def show
    id = params['id']
    @subject = Subject.find(params[:id])
    #render('subjects/show')
  end

  def new
    @subject = Subject.new
    #@subject = Subject.new({:name => 'Default'})
    @subject_count = Subject.count + 1
  end

  def create
    #Instantiate new Object
    @subject = Subject.new(subject_params)
    @subject_count = Subject.count + 1
    #Save Object
    if @subject.save
      flash[:notice] = 'Subject Created successfully'
      redirect_to(:action => 'index')
    else
      render('new')
    end

  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' Destroyed successfully"
    redirect_to(:action => 'index')
  end



  def edit
    @subject = Subject.find(params[:id])
    @subject_count = Subject.count
  end

  def update
    #Instantiate new Object
    @subject = Subject.find(params[:id])

    #Save Update
    if  @subject.update_attributes(subject_params)
      flash[:notice] = 'Subject Updated successfully'
      redirect_to(:action => 'show', :id => @subject.id)
    else
      @subject_count = Subject.count
      render('edit')
    end

  end

  def update_status
    @subject = Subject.find(params[:id])
    if params[:status] == 'true'

      @subject.update_attributes(:visible => '1')
    end
    if params[:status] == 'false'
      @subject.update_attributes(:visible => '0')
    end

    flash[:notice] = 'Subject Updated successfully'
    redirect_to(:action => 'index', :id => @subject.id)
  end

  private
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
