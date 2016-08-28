class CommentsController < ApplicationController
  before_action :authenticate_user!
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
    @post = Post.find(params[:post_id])
    @comment = @post.comments(params[:id])
    @user = User.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to :back
  end

  private

  	def comment_params
  		params.require(:comment).permit(:content)
  	end
end
