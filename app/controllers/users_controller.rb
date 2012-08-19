class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @folders = @user.folders
    @bookmarks = @user.bookmarks
  end
end
