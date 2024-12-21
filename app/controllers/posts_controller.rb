class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(title: params[:post][:title], body: params[:post][:body])
    redirect_to root_path
  end
end
