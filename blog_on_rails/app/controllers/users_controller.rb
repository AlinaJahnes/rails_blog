class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      # You should also log someone in when they sign up - use a session[:user_id] here.
      redirect_to :root
    else
      render :new
      # cool, it sends them back to the form and keeps their old info in there. Some explanatory error messages would be nice.

    end
  end

  def show
    @user = User.find(session[:id])
    @posts = @user.posts
    # Since you have a custom route that takes people to users#profile, you should get rid of this action because you're just duplicating work -- if you wanted to use this instead of a custom route, you'd need to change User.find(session[:id]) to User.find(params[:id]), otherwise no matter what the url says (users/1, users/3, users/1000) it will only show the logged in user's profile. The show action is meant to show any individual user's profile. You don't need a whole action dedicated to taking you to your own profile, you'd just have a link somewhere that takes you to your profile and uses session[:user_id] to put the right ID in place.
  end

  def profile
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
