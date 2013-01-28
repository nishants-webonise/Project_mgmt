class UsersController < ApplicationController

  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])

    if @user.save
      UserMailer.registration_confirmation(@user).deliver
      flash[:notice] = "Account registered!"

      redirect_back_or_default account_path
    else
      render :action => :new
    end
  end

  def index
    @users = User.all
  end

  def show
    @user = @current_user
    @projects = Project.find_all_by_user_id(@user)
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user

    if @user.update_attributes(params[:user])
      flash[:notice] = "Account updated!"

      redirect_to account_path
    else
      render :action => :edit
    end
  end
end
