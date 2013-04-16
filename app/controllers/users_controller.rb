class UsersController < ApplicationController

  before_filter :find_user, only: [:edit, :show, :update]

  def index
    @users = User.all
      respond_to do |format|
      format.html
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    @managers = User.managers
    @valid_managers_email = Array.new
    @managers.each do |manager|
      if manager.email != @user.email
        @valid_managers_email << manager.email
      end
    end
  end

  def update
    @setup = Setup.setupbyyear
    if params[:commit] == "Change"
      @user.manager_id = params[:manager_id]
      @user.joining_date = params[:joining_date]
      @user.role = params[:role]
    end
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'Employees info has changed'
    else
      Rails.logger.info(@user.errors.messages.inspect)
      render :edit
    end
  end

  def show
    respond_to do |format|
      format.html
    end
  end

  def user_management
    @users = User.non_admins
    respond_to do |format|
      format.html
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    flash[:notice] = 'User is successfully deleted.'
    redirect_to user_management_user_path(current_user.id)
  end

  def find_user
    @user = User.find(params[:id])
  end

  def find_user_emails
    @response
    @user = User.find_by_email(params[:email])
    if @user.blank? || @user.nil?
      @response = "User not found"
    else
      @response = "User found"
    end
  end

  def user_profile
    @manager = User.find_by_id(current_user.manager_id)
    @user = User.find_by_id(current_user.id)
    if params[:commit] == "edit_profile"
      respond_to do |format|
        format.html {render "edit_user_profile", object: @user}
      end
    end
  end

  def edit_profile
    @user = User.find_by_id(current_user.id)
    @user.update_attributes(params[:user])
      redirect_to user_profile_user_path(current_user.id)
  end

  def change_password
    @user = User.find_by_id(current_user.id)
    respond_to do |format|
      format.html {render "change_password", object: @user}
    end
  end

  def password_reset
    @user = User.find_by_id(current_user.id)
    @user.update_attributes(params[:user])
    flash[:notice] = 'Password successfully changed.Please Sign in Again.'
    redirect_to destroy_user_session_path, method: :delete
  end
end
