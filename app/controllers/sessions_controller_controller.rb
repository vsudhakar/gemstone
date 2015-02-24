class SessionsControllerController < ApplicationController
  def create
    user = Userfb.omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to_root_url
  end

  def destroy
    session[:user_id] = nil
  end
end
