class SessionsController < ApplicationController
  def new
    redirect_to user_path(current_user) if current_user
  end

  def create
    auth = Instapaper.access_token(params["x_auth_username"], params["password"])
    Instapaper.oauth_token = auth["oauth_token"]
    Instapaper.oauth_token_secret = auth["oauth_token_secret"]
    cred = Instapaper.verify_credentials
    user = User.from_instapaper(auth, cred)
    session[:user_id] = user.id
    # flash[:success] = "Signed in!"
    redirect_to user_path(user)
  end

  def destroy
    session[:user_id] = nil
    # flash[:success] = "Signed out!"
    redirect_to root_url
  end
end
