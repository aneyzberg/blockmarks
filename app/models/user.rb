class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable,
         :omniauthable, :omniauth_providers => [:facebook]

  
  has_many :user_bookmarks
  has_many :bookmarks, through: :user_bookmarks

  has_many :likes, dependent: :destroy

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.name = auth.info.name
      end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def liked(bookmark)

    self.likes.where(bookmark_id: bookmark.id).first

  end

  def liked_bookmarks
    likes.collect(&:bookmark)
  end


  def created(bookmark)

  self.where(bookmark_id: bookmark.id).first

  end

  def user_bookmark_for(bookmark)
    debugger
    self.user_bookmarks.where(bookmark_id: bookmark.id).first
  end




end

