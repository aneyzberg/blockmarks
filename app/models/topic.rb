class Topic < ActiveRecord::Base

  has_many :topic_bookmarks
  has_many :bookmarks, through: :topic_bookmarks

  default_scope{ order('created_at DESC')}

end
