class Bookmark < ActiveRecord::Base
  
  has_many :user_bookmarks
  has_many :users, through: :user_bookmarks

  has_many :topic_bookmarks
  has_many :topics, through: :topic_bookmarks

  has_many :likes, dependent: :destroy

  after_create :set_thumbnail_url



  default_scope{order('created_at DESC')}

private

  def set_thumbnail_url

    embedly_api = Embedly::API.new :key => ENV['EMBEDLY_API_KEY'], :user_agent => 'Mozilla/5.0 (compatible; mytestapp/1.0; my@email.com)'

    @obj = embedly_api.oembed(url: self.url)

    Rails.logger.info ">>>> Embedly : #{@obj.inspect}"

    self.update_attribute(:thumbnail_url, @obj.first['thumbnail_url']) if @obj && @obj.first['thumbnail_url']


  end


end
