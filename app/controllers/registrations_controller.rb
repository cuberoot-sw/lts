class RegistrationsController < Devise::RegistrationsController

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
    elsif params[:commit] == "Test2"
      debugger
      @user = User.new(params[:user])

      respond_to do |format|
        format.html { render "new", :object => @user }
      end
    end
  end

  def second_step
    debugger
        @user = User.new(params[:user])

    respond_to do |format|
      format.html
    end
  end

  def first_step
    debugger
   # @user = User.new(params[:user])
    @user = User.new(params[:user])
    

    respond_to do |format|
        format.html { render "new", :object => @user }
    end
  end

  protected
  def after_sign_up_path_for(resource)
    '/users/sign_in'
  end

  def update
    debugger
  end


  def show
    debugger
  end

end
