class TasksController < ApplicationController

  before_filter :require_user
  # GET /tasks
  # GET /tasks.json
  def index
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:story_id])
    @tasks = Task.all

    respond_to do |format|
      format.html # list_projects.html.erb
      format.json { render json: @tasks }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:story_id])
    @task = Task.find(params[:id])

    respond_to do |format|
      format.html # show_project_dashboard.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:story_id])
    @task = Task.new

    respond_to do |format|
      format.html # new_project.html.erb
      format.js
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:story_id])
    @task = Task.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:story_id])

    @task = Task.new(params[:task])
    @task.story_id = @story.id
    @task.task_status = "In Process"

    respond_to do |format|
      if @task.save
        #format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.html { redirect_to user_project_story_path(@user, @project, @story), notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:story_id])
    @task = Task.find(params[:id])
    @task.task_status = params[:task_status]

    #logger.info("############################{@task.inspect}")

    respond_to do |format|
      if @task.save
        #format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        #format.html { redirect_to user_project_story_path(@user, @project, @story), notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:story_id])
    @task = Task.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to task_path }
      format.json { head :no_content }
    end
  end
end
