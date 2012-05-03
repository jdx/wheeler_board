module Admin
  class ProfilesController < AdminController
    def index
      @profiles = Profile.all
    end

    def show
      @profile = Profile.find(params[:id])
    end

    def new
      @profile = Profile.new
    end

    def create
      @profile = Profile.new(params[:profile])
      if @profile.save
        flash[:notice] = "#{@profile} added successfully."
        redirect_to admin_profiles_path
      else
        render :new
      end
    end

    def edit
      @profile = Profile.find(params[:id])
    end

    def update
      @profile = Profile.find(params[:id])
      @profile.name = params[:profile][:name]
      @profile.avatar = params[:profile][:avatar]
      if @profile.save
        flash[:notice] = "#{@profile} updated successfully."
        redirect_to admin_profile_path(@profile)
      else
        render :edit
      end
    end
  end
end
