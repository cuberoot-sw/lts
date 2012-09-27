module LeavesHelper
  def leaves_index_helper
    if current_user.role == 'manager'
      @leaves = find_leave_by_id_year
    else
      @leaves = find_leave_by_id_year
    end
    @leaves_taken = Leave.where(['user_id = ? and current_status = ? and
                                 year(start_date) = ?',
                                 current_user.id, "Approved",
                                 session[:current_year]]).sum(:no_of_days)

    @setups = Setup.select("total_leaves").where(year: session[:current_year])
    @users = User.find(:all, conditions: ['id = ?' ,
                                          "#{current_user.manager_id}%"])
  end

    protected
  def find_leave_by_id_year
    Leave.find(:all, conditions: ['user_id = ? and
                                              year(start_date) = ?',
                                              current_user.id,
                                              session[:current_year]])
  end
end
