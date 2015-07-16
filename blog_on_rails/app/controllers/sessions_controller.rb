class SessionsController < ApplicationController
  def new
    @user = User.new
  end


  def create
    @user = User.find_by(username: user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      session[:id] = @user.id
      # This should ALWAYS be session[:user_id] -- it's a convention thing, it's also just more specific. It works the other way, but people say :user_id.
      redirect_to :root
    else
      render :new
    end
  end

  def destroy
    session[:id] = nil
    # I like session.delete(:id) because it removes the key rather than setting it to nil.

    redirect_to :root
  end

  private
  def user_params
    params.require(:user).permit(:username, :password)
  end
end
