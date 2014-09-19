class IncomingController < ApplicationController

  # http://stackoverflow.com/questions/1177863/how-do-i-ignore-the-authenticity-token-for-specific-actions-in-rails
  skip_before_filter :verify_authenticity_token, only: [:create]

  def create

  Rails.logger.info ">>>>>>> incoming: #{params.inspect}"
  sender = params[:sender]
  Rails.logger.info ">>>>> sender: #{sender}"
  url = params["stripped-text"]
  Rails.logger.info ">>>> url #{url}"
  subjects = params[:subject]
  Rails.logger.info ">>>>>> subjects #{subjects}"
  
  @user = User.find_by_email(sender)
  if @user 
    Rails.logger.info ">>>>> user: #{@user.inspect}"

    @bookmark = Bookmark.find_or_create_by_url(url)

    Rails.logger.info ">>>>> bookmark: #{@bookmark.inspect}"
    

    if @bookmark.present?
      @bookmark.users << @user 
      Rails.logger.info ">>>> user added"  

      topic_names = subjects
      topic_names.split(" ").each do |topic_name|
        Rails.logger.info ">>>>>  current topic_name: #{topic_name}"
        topic_name = topic_name.sub(/#/, "")
        topic = Topic.find_or_create_by_name(topic_name)
        Rails.logger.info ">>>>>> topic: #{topic.inspect}"
        @bookmark.topics << topic
        Rails.logger.info ">>>> topic added"
      end

      Rails.logger.info ">>>>>sending mail"
      UserMailer.bookmark_email(@user, @bookmark).deliver
      Rails.logger.info "done"
       
    end
  end








  head 200
end

end