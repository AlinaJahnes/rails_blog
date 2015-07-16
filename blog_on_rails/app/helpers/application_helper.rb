module ApplicationHelper
  def current_user
    if session[:id]
      @current_user ||= User.find(session[:id])
    end
  end
  # This should go in your Application controller. The method itself should be called in controllers and not in views, so it doesn't need to be in a helper. In the view, you can access @current_user as long as you make sure to set up a before_action that runs the current_user method in your Application Controller.
end
