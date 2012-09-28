class LeavesController < ApplicationController
  before_filter :find_leave_by_id, only: [:edit, :update, :show]

  # creates new leave and saves it.
  def create
    @leave = current_user.leaves.build(params[:leave])
    @leave.current_status = "Pending"

    respond_to do |format|
      if @leave.save
       # LeaveMailer.leave_email(@leave).deliver
        format.html { redirect_to leave_path(@leave),
                      notice: 'Leave is Submitted' }
      else
        format.html { render "new", error: 'Leave not Submitted' }
      end
    end
  end

  # new leave entry
  def new
    @leave = Leave.new
    respond_to do |format|
      format.html
    end
  end

  # updates leave details and saves updates leave details
  def update
    if params[:commit] == "Approve"
      @leave.current_status = "Approved"
      @leave.approved_by = current_user.id
      @leave.approved_on = Time.now
    elsif params[:commit] == "Reject"
      @leave.current_status = "Rejected"
      @leave.approved_by = current_user.id
      @leave.rejection_reason = params[:rejection_reason]
    elsif params[:commit] == "Reject (in case)"
      @leave.current_status = "Rejected"
    end

    respond_to do |format|
      if @leave.update_attributes(params[:leave])
        format.html { redirect_to leave_path(@leave),
                      notice: 'Leave is successfully updated.' }
      else
        debugger
        format.html { render "edit" }
      end
    end
  end

  # delete applied leave
  def destroy
    @leave = Leave.find_by_id(params[:id])
    @leave.destroy
    flash[:notice] = 'Leave is successfully deleted.'
    redirect_to action: 'index', id: session[:user_id]
  end

  # returns all leaves associated with user
  def index
    if current_user.role == 'manager'
      @leaves = find_leave_by_id_year
    else
      @leaves = find_leave_by_id_year
    end
#    @leaves_taken = Leave.where(['user_id = ? and current_status = ? and
#                                 year(start_date) = ?',
#                                 current_user.id, "Approved",
#                                 session[:current_year]]).sum(:no_of_days)

    @leaves_taken = Leave.where(['user_id = ? and current_status in("Approved", "Pending") and
                                 year(start_date) = ?',
                                 current_user.id,
                                 session[:current_year]]).sum(:no_of_days)

    @setups = Setup.select("total_leaves").where(year: session[:current_year])
    @users = User.find(:all, conditions: ['id = ?' ,
                                          "#{current_user.manager_id}%"])
  end

  # displays applied leave
  def show
    respond_to do |format|
      format.html
    end
  end

  # manager can approve/reject leave of employees under him/her
  def approve_reject
    @leaves = Leave.find(:all, conditions: ['user_id = ?
                                            and current_status = ?',
                                            params[:user_id].to_i, 'Approved'])
    @leave = Leave.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  # returns leaves history as per year
  def set_year
    if params[:commit] = "set"
      session[:current_year] = params[:date][:year]
      redirect_to leaves_url
    end
  end

  protected
  def find_leave_by_id
    @leave = Leave.find(params[:id])
  end

  protected
  def find_leave_by_id_year
    Leave.find(:all, conditions: ['user_id = ? and
                                              year(start_date) = ?',
                                              current_user.id,
                                              session[:current_year]])
  end

 end
