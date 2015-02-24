class SessionsController < ApplicationController
  def create
    user = Userfb.omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    session[:user_name] = user.name
    redirect_to root_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
