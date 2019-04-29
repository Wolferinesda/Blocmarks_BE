class UsersController < ApplicationController
  def show
    @user = current_user
    @user_topics = @user.topics
    @user_bookmarks = @user.bookmarks
    @liked_bookmarks = @user.likes
  end
end
