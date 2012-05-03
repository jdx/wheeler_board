class ProfilesController < ApplicationController
  def edit
    @profile = current_employee.profile || Profile.new
  end

  def update
    @profile = current_employee.profile || Profile.new
    @profile.name = params[:profile][:name]
    @profile.avatar = params[:profile][:avatar]
    @profile.employee = current_employee
    if @profile.save
      flash[:notice] = "Updated profile."
      redirect_to root_path
    else
      render :edit
    end
  end
end
