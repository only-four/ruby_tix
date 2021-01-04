class CommentsController < ApplicationController
  before_action :find_activity
  before_action :authenticate_user!
  # acts_as_paranoid without_default_scope: true  
  
  def create
    p params
    @comment = @activity.comments.build(comment_params)  
    @comment.user = current_user
    @comment.save
  end

  def destroy
    @comment = @activity.comments.find(params[:id])
    @comment.destroy
  end

  private
  def find_activity
    @activity = Activity.find(params[:activity_id])      
  end

  def comment_params
    params.require(:comment).permit( :content, :activity_id)
  end
end
