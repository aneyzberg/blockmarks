class UserBookmarksController < ApplicationController
  
  def index

    @bookmarks = Bookmark.all #current_user(params[:user_id])
  
    #@bookmarks = Bookmark.likes(params[:like_id])

  

  #@topic = Topic.find(params[:topic_id])

  #@like = Like.find(params[:like_id])

  #@bookmarks.users << current_user



 #current user = @bookmarks.users.create(user: current_user)
end




end

