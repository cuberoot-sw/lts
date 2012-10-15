class HolidaysController < ApplicationController
  before_filter :find_holiday, only: [:edit, :show, :update]

  # returns yearwise holiday list
  def index
    @holidays_by_year = Holiday.yeardate
    if params[:commit] == "set"
      if ActiveRecord::Base.connection.is_a?(ActiveRecord::ConnectionAdapters::PostgreSQLAdapter)
        @holidays_by_year = Holiday.find(:all, conditions: \
                                         ['extract(year from date) = ?',
                                          params[:date][:year]])
      elsif ActiveRecord::Base.connection.is_a?(ActiveRecord::ConnectionAdapters::Mysql2Adapter)
   #     @holidays_by_year = Holiday.find(:all, conditions: \
 #                                         ['year(date) = ?',
 #                                         params[:date][:year]])
      end
    end
  end

  # create new holiday entry and saves it in appropriate yearwise holiday list
  def create
    @holiday = Holiday.new(params[:holiday])

    respond_to do |format|
      if @holiday.save
        format.html { redirect_to holidays_index_path(@holiday),
                      notice: 'Holiday is Submitted' }
      else
        format.html { render "new",
                      error: 'Holiday not saved' }
      end
    end
  end

  # create new holiday entry
  def new
    @holiday = Holiday.new
    respond_to do |format|
      format.html
    end
  end

  # show holiday
  def show
    respond_to do |format|
      format.html
    end
  end

  # updates holiday date or holiday name and saves updated holiday
  def update
    respond_to do |format|
      if @holiday.update_attributes(params[:holiday])
        format.html { redirect_to holiday_path(@holiday),
                      notice: 'Holiday is successfully updated' }
      else
        format.html { render "edit" }
      end
    end
  end

  # delete holiday entry(in case)
  def destroy
    @holiday = Holiday.find_by_id(params[:id])
    @holiday.destroy
    flash[:notice] = 'Holiday is successfully deleted.'
    redirect_to action: 'index'
  end

  protected
  def find_holiday
    @holiday = Holiday.find(params[:id])
  end

end
