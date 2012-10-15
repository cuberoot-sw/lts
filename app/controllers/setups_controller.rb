class SetupsController < ApplicationController
  # returns setup of leaves for all year
  def index
    @setups = Setup.all
  end

  def show
    @setup = Setups.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def new
    @setup = Setup.new
    respond_to do |format|
      format.html
    end
  end

  def edit
    @setup = Setup.find(params[:id])
  end

  def update
    @setup = Setup.find(params[:id])
    respond_to do |format|
      if @setup.update_attributes(params[:setup])
        format.html { redirect_to setups_path,
                      notice: 'Setup details successfully updated.' }
      else
        format.html { render "edit" }
      end
    end
  end

  def create
    @setup = Setup.new(params[:setup])

    respond_to do |format|
      if @setup.save
        format.html { redirect_to setups_path,
                      notice: 'Setup details Submitted' }
      else
        format.html { render "new" }
      end
    end
  end

  def destroy
    @setup = Setup.find_by_id(params[:id])
    @setup.destroy
    flash[:notice] = 'Setup is successfully deleted.'
    redirect_to action: 'index'
  end

end


