class AddNetworksController < ApplicationController
    
before_action :set_current_user



def new 
end


def index

   sending_ids = Friend.where(sender_id: @current_user.id).map(&:sending_id)
   sending_ids << @current_user.id

    @userv = User.where.not(id: sending_ids)
end

def follow_account
  sender_id = params[:follow_id]
  @friend = @current_user.friends.create!(sender_id: @current_user.id, sending_id: sender_id)
  if @friend.create
    redirect_to add_user_path
    flash[:success] = "following success"
  else
    flash[:danger] = "following failed"
  end
end

end