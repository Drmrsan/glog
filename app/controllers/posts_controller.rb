class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_post, only: [:show, :update, :edit, :destroy, :upvote, :downvote]

  def index
    @posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 3)
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "Post successfully created!"
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post successfully deleted!"
    redirect_to posts_path
  end

  def upvote
    @post.upvote_by current_user
    redirect_to :back
  end

  def downvote
    @post.downvote_by current_user
    redirect_to :back
  end

  private
    def post_params
      params.require(:post).permit(:title, :description, :image, category_ids:[])
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
