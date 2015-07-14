class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      session[:id] = @user.id
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    session[:id] = nil
    redirect_to :root
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
