class UserBookmarksController < ApplicationController
  
  def index
    @topics = current_user.bookmarks.collect(&:topics).flatten.uniq
    @bookmarks = current_user.bookmarks.uniq 
    @liked_topics = current_user.liked_bookmarks.collect(&:topics).flatten.uniq
    @liked_bookmarks = current_user.liked_bookmarks

    

   

    #@embedly_info = 

  end

end

