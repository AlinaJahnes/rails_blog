class PostsController < ApplicationController
  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
  end

  def create

  end
end
