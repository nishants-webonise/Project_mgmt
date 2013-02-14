class Project < ActiveRecord::Base

  has_and_belongs_to_many :users
  has_many :stories

  attr_accessible :no_of_members, :start_date, :project_name, :project_status, :user_id

    #
    ## GET /projects
    ## GET /projects.json
    #def list_projects
    #  @user = User.find(params[:user_id])
    #  @projects = @user.projects
    #
    #  respond_to do |format|
    #    #format.html # list_projects.html.erb
    #    format.html { redirect_to account_path}
    #    format.json { render json: @projects }
    #  end
    #end
    #
    ## GET /projects/1
    ## GET /projects/1.json
    #def show_project_dashboard
    #  @user = User.find(params[:user_id])
    #  @project = Project.find(params[:id])
    #  @stories = Story.find_all_by_project_id(@project)
    #
    #  respond_to do |format|
    #    format.html # show_project_dashboard.html.erb
    #    format.json { render json: @project }
    #  end
    #end
    #
    ## GET /projects/new
    ## GET /projects/new.json
    #def new_project
    #  @user = User.find(params[:user_id])
    #  @project = Project.new
    #
    #  respond_to do |format|
    #    format.html # new_project.html.erb
    #    format.json { render json: @project }
    #  end
    #end
    #
    ## GET /projects/1/edit
    #def edit_project
    #  @user = User.find(params[:user_id])
    #  @project = Project.find(params[:id])
    #end
    #
    ## POST /projects
    ## POST /projects.json
    #def create_project
    #  @user = User.find(params[:user_id])
    #  @project = Project.new(params[:project])
    #  @project.user_id = @user.id
    #
    #  respond_to do |format|
    #    if @project.save
    #      #format.html { redirect_to user_project_path(@user, @project), notice: 'Project was successfully created.' }
    #      format.html { redirect_to account_path, notice: 'Project was successfully created.' }
    #      format.json { render json: @project, status: :created, location: @project }
    #    else
    #      format.html { render action: "new" }
    #      format.json { render json: @project.errors, status: :unprocessable_entity }
    #    end
    #  end
    #end
    #
    ## PUT /projects/1
    ## PUT /projects/1.json
    #def update_project
    #  @user = User.find(params[:user_id])
    #  @project = Project.find(params[:id])
    #
    #  respond_to do |format|
    #    if @project.update_attributes(params[:project])
    #      format.html { redirect_to @project, notice: 'Project was successfully updated.' }
    #      format.json { head :no_content }
    #    else
    #      format.html { render action: "edit" }
    #      format.json { render json: @project.errors, status: :unprocessable_entity }
    #    end
    #  end
    #end
    #
    ## DELETE /projects/1
    ## DELETE /projects/1.json
    #def destroy_project
    #  @user = User.find(params[:user_id])
    #  @project = Project.find(params[:id])
    #  @project.destroy
    #
    #  respond_to do |format|
    #    format.html { redirect_to user_project_path }
    #    format.json { head :no_content }
    #  end
    #end
    #
    #def add_project_users
    #  #@user = User.find(params[:user_id])
    #  @users = User.all
    #  @project = Project.find(params[:id])
    #end
    #
    #def save_project_users
    #  @project = Project.find(params[:id])
    #  @olduser = @project.user_id
    #  @project_users = @project.users
    #
    #  if params[:user_ids].present?
    #    params[:user_ids].each do |i|
    #      selected_user = User.find(i)
    #      @project_users.include?(selected_user) ? "" : @project_users.push(selected_user)
    #    end
    #    flash[:success] = "Users are added successfully."
    #  else
    #    flash[:error] = "Please select atleast one user."
    #  end
    #  redirect_to user_project_path(@olduser, @project)
    #end
end
