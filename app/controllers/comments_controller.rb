class CommentsController < ApplicationController
  def create
    @comment = Comment.new(params[:comment])
    if @comment.save
      redirect_to task_path(@comment.task)
    else

    end

  end
end
