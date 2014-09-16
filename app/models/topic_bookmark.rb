class TopicBookmark < ActiveRecord::Base
  belongs_to :topic
  belongs_to :bookmark
end
