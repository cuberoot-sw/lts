class UsersController < ApplicationController
  #returns all users list 
  def index
    @users = User.all
      respond_to do |format|
      format.html
    end
  end

  def first_step
    debugger
  #  permanent_address = params[:permanent_address]
 #   emergency_phone_number = params[:emergency_phone_number]
    user = params[:user]
    search = params[:search]
    official_email_id = params[:user][:official_email_id]
    render "first_step"
 #   render "first_step", :locals => {:offical_email => offical_email_id}
  end
 
 # edit user details
  def edit
    @user= User.find(params[:id])
  end

  # update user details and saves updated details
  def update
    @setup = Setup.setupbyyear
    @user = User.find(params[:id])
    if params[:commit] == "Change"
      @user.updateuserdetails
    end

    if @user.update_attributes(params[:user])
      redirect_to @user, :notice => 'Employees info has changed'
    else
      Rails.logger.info(@user.errors.messages.inspect)
      render :edit
    end
  end

  # shows user details
  def show
    @user = User.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  # returns all users except admin
  def user_management
    @users = User.non_admins
    #@users = User.find(:all, :conditions => ['id = ?' , "#{current_user.manager_id}%"])
    respond_to do |format|
      format.html
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    flash[:notice] = 'User is successfully deleted.'
    #redirect_to :action => 'user_management', :id=>session[:user_id]
    redirect_to user_management_user_path(current_user.id)
  end

end
