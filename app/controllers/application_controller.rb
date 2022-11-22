class ApplicationController < ActionController::Base

  

  before_action :set_query

  def set_query
     @q = User.ransack(params[:q])
  end

  
    def set_current_user
    
      if session[:user_id]
        @current_user = User.find_by(id: session[:user_id]) 
        
      end
      
    end



    def logged_in?
        !!set_current_user
      end

    def admin?
        set_current_user.try(:admin)
    end


    def require_admin
    unless admin?
      flash[:alert] = 'You are not authorized to perform this action'
      redirect_to products_path
    end
  end





    def require_user_logged_in!
      redirect_to sign_in_path, alert: "You must be signed in to do that." if @current_user.nil?
      end

     


      



     


     
  
      
end
