class TasksController < ApplicationController
  def new
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
  end

  def create
    @list = List.find(params[:list_id])
    @task = @list.tasks.new(task_params)
    if @task.save
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def show
    @list = List.find(params[:list_id])
    @task = @list.tasks.new
    render :show
  end

  def destroy
    binding.pry
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to list_tasks_path
  end

private
  def task_params
    params.require(:task).permit(:description)
  end
end
