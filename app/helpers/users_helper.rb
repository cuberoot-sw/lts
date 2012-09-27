module UsersHelper
  def options_for_post_bloodgroup
    options_for_select([["A+", "A+"], ["A-", "A-"], ["B+", "B+"],
                        ["B-", "B-"], ["AB+", "AB+"], ["AB-", "AB-"],
                        ["O+", "O+"], ["O-", "O-"]])
  end

  def user_manager_email(user)
    if(user.manager_id.to_f > 0)
      @user = User.find(user.manager_id)
      @user.email
    end
  end
end
