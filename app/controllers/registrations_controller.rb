class RegistrationsController < Devise::RegistrationsController

  before_filter :destroy_session, only: [:new]
  before_filter :new_user, only: [:create, :second_step, :first_step]
  def create
    if params[:commit] == "Sign up"
      if @user.save!
        if @user.active_for_authentication?
          set_flash_message :notice, :signed_up if is_navigational_format?
          sign_in(@user)
          respond_with @user, location: after_sign_up_path_for(@user)
        else
          set_flash_message :notice,
                   :"signed_up_but_#{@user.inactive_message}" if is_navigational_format?
          expire_session_data_after_sign_in!
          respond_with @user, location: after_inactive_sign_up_path_for(@user)
        end
      else
        flash[:error] = "Problem signing up"
      end
    elsif params[:commit] == "Previous"
      session[:date_of_birth] = @user.date_of_birth

      respond_to do |format|
        format.html { render "new", object: @user }
      end
    end
  end

  def second_step
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
    @user.email = session[:email]
    @user.phone_number = session[:phone_number]
    @user.emergency_phone_number = session[:emergency_phone_number]
    @user.emergency_contact_person = session[:emergency_contact_person]
    @user.alternate_phone_number = session[:alternate_phone_number]
    @user.official_email_id = session[:official_email_id]
    @user.alternate_email_id = session[:alternate_email_id]

    respond_to do |format|
        format.html { render "new", object: @user }
    end
  end

  def destroy_session
    reset_session
  end

  def new_user
    @user = User.new(params[:user])
  end

  protected
  def after_sign_up_path_for(resource)
    '/users/sign_in'
  end

end
