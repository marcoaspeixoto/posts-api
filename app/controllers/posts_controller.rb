class PostsController < ApplicationController

  def index
    @posts = Post.all

    render json: @posts
  end

  def show
    @post = Post.find params[:id]

    render json: @post
  end

  def create
    @post = Post.new post_params

    if @post.save
      render json: @post, status: :created
    else
      render json: @post.errors, status: :unprocessable_entity
    end
  end

  def update
    @post = Post.find params[:id]

    if @post.update post_params
      render json: @post, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.permit(:title, :content, :author)
  end
end
