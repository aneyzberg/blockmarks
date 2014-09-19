class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create

  Rails.logger.info ">>>>>>> incoming: #{params.inspect}"
  
  @user = User.find_by_email(params[:sender])
  if @user 

    @bookmark = Bookmark.find_or_create_by_url(params["stripped-text"])
    

    if @bookmark.present?
      @bookmark.users << @user   

      topic_names = params[:subject]
      topic_names.split(" ").each do |topic_name|
        topic_name = topic_name.sub(/#/, "")
        topic = Topic.find_or_create_by_name(topic_name)
        @bookmark.topics << topic
      end


      UserMailer.bookmark_email(@user, @bookmark).deliver

       
    end
  end








  head 200
end

end