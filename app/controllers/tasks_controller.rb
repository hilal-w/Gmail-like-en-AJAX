class TasksController < ApplicationController
before_action :authenticate_user!
  def new
    @categories = Category.all
  end

  def create
    @task = Task.new(task_params)
    @category = Category.find(category_params)
    @task.category = @category

    respond_to do |format|
      if @task.save
        format.html do
          flash[:notice] = "Task created"
          redirect_to root_path
        end
        format.js{}
      else
        format.html do
          flash[:notice] = "Please try again"
          redirect_to root_path
        end
      end
    end
    
  end

  def edit
    @task = Task.find(params[:id])
    @categories = Category.all

  end

  def update
    @task = Task.find(params[:id])
    if params[:status] != nil
      if params[:statvalue] == "1"
        @task.status = true
        @task.save
      else
        @task.status = false
        @task.save
      end
    end
    respond_to do |format|
      format.html do
        @task.update(task_params)
        redirect_to tasks_path
        flash[:notice] = "Task edited"
      end
      format.js {}
    end
    
  end

  def index
    @tasks = Task.all
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html do
        redirect_to root_path
      end
      format.js{}
    end
  end


  private

  def task_params
    params.permit(:title, :deadline, :description)
  end

  def category_params
    params.require(:Category)
  end

end
