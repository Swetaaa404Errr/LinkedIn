class ProfilesController < ApplicationController
  before_action :set_current_user

  def index
    @profile = @current_user.profile
  end

  def new
    @profile = Profile.new
  end

  def create
    
    @profile = @curent_user.profile.create(profile_params)

    

    if @profile.save
      
      redirect_to profiles_path, notice: 'User Information Saved Thank you'
    else

      render :new
    end
  end

  def show
   
    @profile = @current_user.profile.find(params[:id])

    
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)

      redirect_to profiles_path, notice: 'Successfully updated jobrole'
    else

      render :edit
    end
  end

  def dashboard
  end

  private

  def profile_params
    params.require(:profile).permit(:email, :username, :qualification, :experience, :skills, :organisation,
                                    :job_role, :image, :cv, :certificates, :notification, user_id: [])
  end
end
