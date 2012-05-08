class WheelersController < ApplicationController
  before_filter :set_active_tab

  def new
    @wheeler = Wheeler.new
  end

  def create
    @wheeler = Wheeler.new(params[:wheeler])
    if @wheeler.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def set_active_tab
    @active_tab = 'wheeler'
  end
end
