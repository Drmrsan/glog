class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :edit, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
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
  end

  def destroy
  end

  private
    def post_params
      params.require(:post).permit(:title, :description)
    end

    def find_post
      @post = Post.find(params[:id])
    end
end
