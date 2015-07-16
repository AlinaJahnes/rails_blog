class PostsController < ApplicationController
  def show
    @post = Post.find_by_id(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      # redirect_to new_post_path, error: @post.errors.full_messages
      # I don't think you can access error the way you had it - I tried and couldn't get anything to print.
    end
  end

  def edit
    @post = Post.find_by_id(params[:id])
  end

  def update
    @post = Post.find_by_id(params[:id])
    @post.update(post_params)
    # You could use some error handling here by using @post.assign_attributes and then if @post.save.

    redirect_to @post
  end

  def destroy
    user = User.find_by(id: session[:id])
    post = Post.find_by(id: params[:id]).destroy
    redirect_to user_path(user)
    #I think I'd just say:
     # redirect_to user_path(current_user) or user_path(@current_user) (depending on how you set your code up)
     #this lets you get rid of finding the line finding the user.

  end

  private
  def post_params
    params.require(:post).permit(:title, :content).merge(user_id: session[:id])
    # very cool user of merge!! You taught me something. :)

  end
end
