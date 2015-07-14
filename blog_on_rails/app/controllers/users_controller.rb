class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to :root
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(session[:id])
    @posts = Post.where(user_id: session[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end