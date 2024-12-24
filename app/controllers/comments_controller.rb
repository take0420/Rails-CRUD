class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)

    if @comment.save
      redirect_to @post
    else
      render 'posts/show', status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @post.comments.find(params[:id]).destroy
    redirect_to @post
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
