class BookmarksController < ApplicationController
  

  def index
    @bookmarks = Bookmark.all
  end

  def show
    @bookmark = Bookmark.find(params[:id])
  end

  def create
    #@bookmark = Bookmark.find_or_create_by_url(params[:bookmark][:url])

    bookmark = Bookmark.where(url: params[:bookmark][:url]).first
    @bookmark = bookmark.present? ? bookmark : Bookmark.create(params.require(:bookmark).permit(:url))

    #@topic = Topic.find(params[:topic_id])

    if @bookmark.present?
      #success 
      @bookmark.users << current_user
      #@bookmark.users.create(user: current_user)

      topic_names = params[:topic_names]
      topic_names.split(" ").each do |topic_name|
        topic_name = topic_name.sub(/#/, "")
        topic = Topic.find_or_create_by_name(topic_name)
        @bookmark.topics << topic
        #@bookmark.topics.create(topic: topic)
      end


        if @bookmark.save
        flash[:notice] = "Bookmark was saved."

        redirect_to topics_path

      #set flash message for success
        else
        flash[:error] = "There was an error saving your Bookmark. Please try again"
        render :new
        # failed 
        end
  end
end
    

    #set flash message for success


  def new
    @bookmark = Bookmark.new
  end

  def edit
  end

  def update
  end




 

  

end
