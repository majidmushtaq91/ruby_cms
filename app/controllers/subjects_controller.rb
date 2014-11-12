class SubjectsController < ApplicationController
  layout false

  def index
    @subjects = Subject.sorted
  end

  def show
    id = params['id']
    @subject = Subject.find(params[:id])
    #render('subjects/show')
  end

  def new
    @subject = Subject.new({:name => 'Default'})
  end


  def delete
    @subject = Subject.find(params[:id])
    if @subject.destroy
      redirect_to(:action => 'index')
    else
      redirect_to(:action => 'index')
    end

  end

  def create
    #Instantiate new Object
    @subject = Subject.new(subject_params)
    #Save Object
    if @subject.save
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
