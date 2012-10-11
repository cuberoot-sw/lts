module LeavesHelper
  def leaves_index_helper
    if current_user.role == 'manager'
      @leaves = find_leave_by_id_year
    else
      @leaves = find_leave_by_id_year
    end
    if ActiveRecord::Base.connection.is_a?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
    @leaves_taken = Leave.where(['user_id = ? and current_status = ? and
                                 extract(year from start_date) = ?',
                                 current_user.id, 'Approved',
                                 session[:current_year]]).sum(:no_of_days)
    elsif ActiveRecord::Base.connection.is_a?(ActiveRecord::ConnectionAdapters::MySQLAdapter)
    @leaves_taken = Leave.where(['user_id = ? and current_status = ? and
                                 year(start_date) = ?',
                                 current_user.id, "Approved",
                                 session[:current_year]]).sum(:no_of_days)
    end

    @setups = Setup.select("total_leaves").where(year: session[:current_year])
    if ActiveRecord::Base.connection.is_a?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
    @users = User.find(:all, conditions: ['id = ?' ,
                                          "#{current_user.manager_id.to_i}"])
    elsif ActiveRecord::Base.connection.is_a?(ActiveRecord::ConnectionAdapters::MySQLAdapter)
    @users = User.find(:all, conditions: ['id = ?' ,
                                          "#{current_user.manager_id}%"])
    end
  end

  protected
  def find_leave_by_id_year
    if ActiveRecord::Base.connection.is_a?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
    Leave.find(:all, conditions: ['user_id = ? and
                                              extract(year from start_date) = ?',
                                              current_user.id,
                                              session[:current_year]])
    elsif ActiveRecord::Base.connection.is_a?(ActiveRecord::ConnectionAdapters::MySQLAdapter)
    Leave.find(:all, conditions: ['user_id = ? and
                                              year(start_date) = ?',
                                              current_user.id,
                                              session[:current_year]])
    end
  end
end
