class BookmarksController < ApplicationController
  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    @bookmark = Bookmark.new(params.require(:bookmark).permit(:url))
  end

  def new
    @bookmark = Bookmark.new
  end

  def edit
    bookmark = Bookmark.find(params[:id])
  end
end
