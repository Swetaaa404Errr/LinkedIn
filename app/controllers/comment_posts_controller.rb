# frozen_string_literal: true

class CommentPostsController < ApplicationController
  def new
    @comment_post = CommentPost.new(comment_post_params)
  end

  def create
    @job_navigation = JobNavigation.find_by(params[:job_navigation_id])

    @comment_post = @job_navigation.comment_posts.new(comment_post_params)

    if @comment_post.save
      redirect_to job_show_path, notice: 'comment Saved'
    else

      redirect_to job_show_path, notice: 'comment not Saved'
    end
  end

  def comment_post_params
    params.require(:comment_post).permit(:body).merge(job_navigation_id: params[:job_navigation_id])
  end
end
