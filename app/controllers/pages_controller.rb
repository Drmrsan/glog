class PagesController < ApplicationController
  def index
  	@posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 3)
  end

  def about
  end

  def contact
  end
end
