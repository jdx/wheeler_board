class HomeController < ApplicationController
  before_filter :authenticate, except: :index

  def index
    return render :logged_out unless employee_signed_in?
    return redirect_to edit_employee_profile_path unless current_employee.profile and current_employee.profile.avatar?
    @current_wheeler = Wheeler.order('date desc, created_at desc').first
    return redirect_to new_wheeler_path unless @current_wheeler
    @wheelers = Wheeler.order('date desc, created_at desc').page params[:page]
  end

  private

  def authenticate
    unless current_employee and current_employee.profile
      flash[:error] = "You must be logged in to continue"
      return false
    end
  end
end
