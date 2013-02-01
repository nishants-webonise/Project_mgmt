class StoriesController < ApplicationController
  # GET /stories
  # GET /stories.json
  def index
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @stories = Story.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stories }
    end
  end

  # GET /stories/1
  # GET /stories/1.json
  def show
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
    @project_users = @project.users

    @tasks = Task.find_all_by_story_id(@story)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @story }
    end
  end

  # GET /stories/new
  # GET /stories/new.json
  def new
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @story = Story.new

    respond_to do |format|
      format.html # new.html.erb
      format.js
      format.json { render json: @story }
    end
  end

  # GET /stories/1/edit
  def edit
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
  end

  # POST /stories
  # POST /stories.json
  def create
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])

    @story = Story.new(params[:story])
    @story.project_id = @project.id

    respond_to do |format|
      if @story.save
        #format.html { redirect_to @story, notice: 'Story was successfully created.' }
        format.html { redirect_to user_project_path(@user, @project), notice: 'Story was successfully created.' }
        format.json { render json: @story, status: :created, location: @story }
      else
        format.html { render action: "new" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stories/1
  # PUT /stories/1.json
  def update
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])

    respond_to do |format|
      if @story.update_attributes(params[:story])
        #format.html { redirect_to @story, notice: 'Story was successfully updated.' }
        format.html { redirect_to user_project_path(@user, @project), notice: 'Story was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @story.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stories/1
  # DELETE /stories/1.json
  def destroy
    @user = User.find(params[:user_id])
    @project = Project.find(params[:project_id])
    @story = Story.find(params[:id])
    @story.destroy

    respond_to do |format|
      format.html { redirect_to user_project_path(@user, @project) }
      format.json { head :no_content }
    end
  end
end
