class BookmarksController < ApplicationController
  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @topic = Topic.find(params[:topic_id])
    @bookmark = current_user.bookmarks.create(bookmark_params)
    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "Bookmark was saved."
      redirect_to [@topic, @bookmark]
    else
      puts @bookmark.errors.full_messages
    end
  end

  def new
    @bookmark = Bookmark.new
    @topic = Topic.find(params[:topic_id])
  end

  def edit
    @bookmark = Bookmark.find(params[:id])
  end

  def update
    @bookmark = Bookmark.find(params[:id])
    @bookmark.url = params[:bookmark][:url]
    authorize @bookmark

    if @bookmark.save
     flash[:notice] = "Bookmark was updated."
     redirect_to [@bookmark.topic, @bookmark]
    else
     flash[:error] = "There was an error saving this bookmark. Please try again."
     render :edit
    end
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    authorize @bookmark

     if @bookmark.destroy
       flash[:notice] = "Bookmark was deleted successfully."
       redirect_to @bookmark.topic
     else
       flash.now[:alert] = "There was an error deleting the bookmark."
       render :show
     end
  end

  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
end
