class TasksController < ApplicationController
  def index
    @tasks = Task.where({"user_id" => session["id"]})
    @task = Task.new
  end

  def create
    @task = Task.new
    @task["description"] = params["task"]["description"]
    @task.save
    redirect_to "/tasks"
  end

  def destroy
    @task = Task.find_by({ "id" => params["id"] })
    if @current_user["id"] == @task["user_id"]
    @task.destroy
    redirect_to "/tasks"
  end
end
