class SessionsController < ApplicationController

    
    
    def new
    end

    def create
          
        user = User.find_by(email: params[:email])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] =user.id
            
           if logged_in? && admin?
            redirect_to jobadd_path, notice: " Choose"  
            
           else
            redirect_to new_user_inf_path, notice: " Fill the form"
           end
        else
            flash[:alert] = "Invalid email or password"
            render :new
        end

     
    end

    def user_suggest
    

        @user = User.all

    end
    
    
    
    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged out successfully"

    end

end

   