class ProfilesController < ApplicationController
  before_action :set_current_user

  def index
    @profile = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @c_user = @current_user
    @profile = Profile.create(profile_params)

    @c_user.profile = @profile

    if @profile.save
      @profile.update(exist: true)
      redirect_to profiles_path, notice: 'User Information Saved Thank you'
    else

      render :new
    end
  end

  def show
    @profile = Profile.all
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

  private

  def profile_params
    params.require(:profile).permit(:email, :username, :qualification, :experience, :skills, :organisation,
                                    :job_role, :image, :cv, :certificates, :notification, user_id: [])
  end
end
