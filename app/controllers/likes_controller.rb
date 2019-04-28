class LikesController < ApplicationController
  def index
  end

  def create
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.build(bookmark: @bookmark)

    if like.save
      flash[:notice] = "Bookmark liked!"
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:alert] = "Something went wrong. Please try again."
      redirect_to [@bookmark.topic, @bookmark]
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:bookmark_id])
    like = current_user.likes.find(params[:id])
    # Get the bookmark from the params
    # Find the current user's like with the ID in the params

    if like.destroy
      flash[:notice] = "Bookmark unliked!"
      redirect_to [@bookmark.topic, @bookmark]
    else
      flash[:alert]  = "Sonething went wrong. Please try again."
      redirect_to [@bookmark.topic, @bookmark]
    end
  end
end
