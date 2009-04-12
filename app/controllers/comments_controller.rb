class CommentsController < ApplicationController
  
  def create
    comment = Comment.new(params[:comment])
    if current_author
      comment.comment_commenter_id = current_author.id
      comment.created_by = current_author.id
    end
    comment.visible = 1
    comment.junk_score = 1
    comment.junk_status = 1
    comment.created_on = Time.now
    
    comment.save
    redirect_back_or_default('/')
  end
end
