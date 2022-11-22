class UserInfsController < ApplicationController

   
  before_action :set_current_user

  
    

    def new
        @user_inf = UserInf.new
    end

    def create
       
        @user_inf = @current_user.user_inf.new(user_inf_params)

        if @user_inf.save
            redirect_to user_info_path, notice: "User Info Saved"
        else
            
            render :new
        end
    end

    


    private

    def user_inf_params
        params.require(:user_inf).permit(:email, :username,  :qualification, :experience, :skills, :organisation, :job_role,   :image, :cv, :certificates, :notification, user_id: [])
    end
end
