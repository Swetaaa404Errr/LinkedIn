class UsersController < ApplicationController

    before_action :set_current_user
    
    def notification
    end

    def connection
    end


  def index
   @userv = User.where.not(id: @current_user.id )
  end

  def follow
     @user = User.find(params[:id])
    @current_user.send_follow_request_to(@user)
    redirect_to users_path
  end

  def unfollow
     @user = User.find(params[:id])
    make_it_a_unfriend_request

    @current_user.unfollow(@user)
    redirect_to users_path
  end

  def accept
    @user = User.find(params[:id])
    @current_user.accept_follow_request_of(@user)
    make_it_a_friend_request
    redirect_to notification_path
  end

  def decline
    @user = User.find(params[:id])
    @current_user.decline_follow_request_of(@user)
    redirect_to notification_path
  end

  def cancel
    @current_user.remove_follow_request_for(@user)
    redirect_to root_path
  end

  private

  def make_it_a_friend_request
    @current_user.send_follow_request_to(@user)
    @user.accept_follow_request_of(@current_user)
  end

  def make_it_a_unfriend_request
    @user.unfollow(@current_user) if @user.mutual_following_with?(@current_user)
  end

  
  





end
