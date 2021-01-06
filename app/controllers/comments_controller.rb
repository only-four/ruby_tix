class CommentsController < ApplicationController
  before_action :authenticate_user!
  # acts_as_paranoid without_default_scope: true  
  
  def create
    p params
    @activity = Activity.find(params[:activity_id])  
    @comment = @activity.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
  end

  def destroy
    @activity = Activity.find(params[:activity_id])      
    @comment = @activity.comments.find(params[:id])
    @comment.destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:content)
  end
end
