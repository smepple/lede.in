class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @user.authorize
    @bookmarks = Instapaper.bookmarks("limit" => 10)
  end
end
