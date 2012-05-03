class HomeController < ApplicationController
  skip_before_filter :authenticate_employee!

  def index
    return render :logged_out unless employee_signed_in?
    return redirect_to edit_employee_profile_path unless current_employee.profile
    @current_wheeler = Wheeler.order('date desc, created_at desc').first
    return redirect_to new_wheeler_path unless @current_wheeler
    @wheelers = Wheeler.order('date desc, created_at desc').page params[:page]
  end
end
