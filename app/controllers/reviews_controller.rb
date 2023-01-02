class ReviewsController < ApplicationController
  before_action :set_current_user

  def create
    @job_navigation = JobNavigation.find(params[:id])
    @review = @job_navigation.reviews.create(review_params)
    redirect_to job_navigations_path
  end

  private

  def review_params
    params.require(:review).permit(:reviewer, :body)
  end
end
