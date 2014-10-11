module BookmarksHelper

  def select_bookmarks_for(topic, bookmarks)
    bookmarks.select{|bookmark| bookmark.topics.include?(topic)}
  end

  



end


