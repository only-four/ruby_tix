class CommentsController < ApplicationController
  before_action :authenticate_user!
  acts_as_paranoid without_default_scope: true  
  def create
    @activity = Avtivity.find(parmas[:id])  
    @comment = @activity.comments.create(comment_params)  
  end

  private
  def comment_params
    params.require(:comment).permit(:id, :content, :activity_id, :user_id)
  end
end
