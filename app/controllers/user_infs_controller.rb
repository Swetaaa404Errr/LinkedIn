class UserInfsController < ApplicationController

   

    def new
        @user_inf = UserInf.new
    end

    def create
        @user_inf = UserInf.new(user_inf_params)
        if @user_inf.save
            redirect_to root_path, notice: "User Info Saved"
        else
            
            render :new
        end
    end
    private

    def user_inf_params
        params.require(:user_inf).permit(:email, :username,  :qualification, :experience, :skills, :organisation,  :job_role, :notification, :image)
    end
end
