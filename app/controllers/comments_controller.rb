class CommentsController < ApplicationController
  def create
  	@post = Post.find(params[:post_id])
  	@comment = @post.comments.create(comment_params)
  	@comment.user_id = current_user.id

  	if @comment.save
  		redirect_to post_path(@post)
  	else
  		render 'new'
  	end
  end

  def show
  	@post = Post.find(params[:id])
  	@comment = @post.comments(params[:post_id])
  end

  private

  	def comment_params
  		params.require(:comment).permit(:content)
  	end
end
