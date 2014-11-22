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
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    subject = Subject.find(params[:id]).destroy
    flash[:notice] = "Subject '#{subject.name}' Destroyed successfully"
    redirect_to(:action => 'index')
  end

  def create
    #Instantiate new Object
    @subject = Subject.new(subject_params)
    #Save Object
    if @subject.save
      flash[:notice] = 'Subject Created successfully'
      redirect_to(:action => 'index')
    else
      render('new')
    end

  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    #Instantiate new Object
    @subject = Subject.find(params[:id])

    #Save Update
    if  @subject.update_attributes(subject_params)
      flash[:notice] = 'Subject Updated successfully'
      redirect_to(:action => 'show', :id => @subject.id)
    else
      render('edit')
    end

  end

  private
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
