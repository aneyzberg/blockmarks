class UserBookmark < ActiveRecord::Base
  belongs_to :user
  belongs_to :bookmark
end
