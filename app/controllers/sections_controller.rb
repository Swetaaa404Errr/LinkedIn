class SectionsController < ApplicationController
  def new; end

  def create
    admin = Admin.find_by(email: params[:email])
    return unless admin.present? && admin.authenticate(params[:password])

    session[:admin_id] = admin.id

    elseredirect_to jobadd_path, notice: ' Choose'
    flash[:alert] = 'Invalid email or password'
    render :new
  end

  def destroy
    session[:admin_id] = nil
    redirect_to root_path, notice: 'logged out'
  end
end
