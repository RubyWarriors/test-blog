class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy, :rate]

  def create
    comment        = Comment.new(comment_params)
    comment.author = current_user
    if comment.save
      redirect_to comment.post, notice: t('comments.created')
    else
      redirect_to comment.post, notice: comment.errors.full_messages.each.collect { |m| m } 
    end
  end

  def update
  end

  def approve
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id,  :parent_id)
  end
end
