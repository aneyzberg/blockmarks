class LikesController < ApplicationController

def create

  @bookmark = Bookmark.find(params[:bookmark_id])



  like = current_user.likes.build(bookmark: @bookmark)



    if like.save

    flash[:notice] = "You have successfully liked this bookmark"
    redirect_to user_bookmarks_path

    else

    flash[:error] = "You were not able to like this bookmark. Please try again"

    end
  end

def destroy

  #@bookmark = Bookmark.find(params[:bookmark_id])

  
 #@bookmark = Bookmark.find(params[:bookmark_id])

  #@like.users.create(user: current_user)

  #@like.bookmarks.create(bookmark: bookmark)

  like = current_user.likes.find(params[:id])

  if like.destroy

    flash[:notice] = "Like has been deleted"

    redirect_to user_bookmarks_path
  else

    flash[:error] = "Unable to delete like. Please try again"
    redirect_to user_bookmarks_path

  end
end

end




