class BookmarksController < ApplicationController
  inject :bookmark_catalogue

  def index
    @bookmarks = bookmark_catalogue.bookmarks
  end

  def new
  end
  
  def create
    bookmark_catalogue.bookmark(url: params[:bookmark_url])
    redirect_to bookmarks_path, notice: "Bookmark created"
  rescue BookmarkInvalid
    render :new
  end

end
