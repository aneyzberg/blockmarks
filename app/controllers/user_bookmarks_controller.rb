class UserBookmarksController < ApplicationController
  
  def index
    @topics = current_user.bookmarks.collect(&:topics).flatten.uniq
    @bookmarks = current_user.bookmarks.uniq 
    @liked_topics = current_user.liked_bookmarks.collect(&:topics).flatten.uniq
    @liked_bookmarks = current_user.liked_bookmarks

  end

   def destroy

        @user_bookmark = UserBookmark.find(params[:id])

        if @user_bookmark.destroy

          flash[:notice] = "Bookmark was deleted"

          redirect_to user_bookmarks_index_path

        else

        flash[:error] = "there was an error deleting your Bookmark. Please try again"

        redirect_to user_bookmarks_index_path

        end 


 

    #@embedly_info = 

  end

end

