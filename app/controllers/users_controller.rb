class UsersController < ApplicationController
  def new
  end

  def create
  end

  def show
    @user = User.find(params[:id])
    @folders = @user.get_folder_list
    @bookmarks = @user.get_bookmarks_list(10)
  end
end
