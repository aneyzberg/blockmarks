class UserBookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookmark

  #def userbookmarks(bookmark)

    #current_user.bookmarks.where(bookmark_id: bookmark.id).first

  #end

  #def userliked(like)

    #current_user.bookmarks.likes.where(like_id: like.id).first

end