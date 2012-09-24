class RegistrationsController < Devise::RegistrationsController

  before_filter :destroy_session, :only => [:new]
  def create
    debugger
    @user = User.new(params[:user])
    
    if params[:commit] == "Sign up"
      #    do something
      if @user.save!
        if @user.active_for_authentication?
          set_flash_message :notice, :signed_up if is_navigational_format?
          sign_in(@user)
          respond_with @user, :location => after_sign_up_path_for(@user)
        else
          set_flash_message :notice, :"signed_up_but_#{@user.inactive_message}" if is_navigational_format?
          expire_session_data_after_sign_in!
          respond_with @user, :location => after_inactive_sign_up_path_for(@user)
        end
      else
        flash[:error] = "Problem signing up"
      end

#    elsif params[:commit] == "Previous"
#      @user = User.new(params[:user])
#
#      respond_to do |format|
#        format.html { render "new", :object => @user }
#      end
#    end 
    elsif params[:commit] == "Previous"
      debugger

      session[:date_of_birth] = @user.date_of_birth

      respond_to do |format|
        format.html { render "new", :object => @user }
      end
    end
  end

  def second_step
    debugger
    @user = User.new(params[:user])
    session[:email] = @user.email
    session[:phone_number] = @user.phone_number
    session[:emergency_phone_number] = @user.emergency_phone_number
    session[:emergency_contact_person] = @user.emergency_contact_person
    session[:alternate_phone_number] = @user.alternate_phone_number
    session[:official_email_id] = @user.official_email_id
    session[:alternate_email_id] = @user.alternate_email_id

    @user.date_of_birth = session[:date_of_birth]


    respond_to do |format|
      format.html
    end
  end

  def first_step
    debugger
    @user = User.new(params[:user])

    @user.email = session[:email]
    @user.phone_number = session[:phone_number]
    @user.emergency_phone_number = session[:emergency_phone_number]
    @user.emergency_contact_person = session[:emergency_contact_person]
    @user.alternate_phone_number = session[:alternate_phone_number]
    @user.official_email_id = session[:official_email_id]
    @user.alternate_email_id = session[:alternate_email_id]

    respond_to do |format|
        format.html { render "new", :object => @user }
    end
  end

  def destroy_session
    reset_session
  end

  protected
  def after_sign_up_path_for(resource)
    '/users/sign_in'
  end

end
