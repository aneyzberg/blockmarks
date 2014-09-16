class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:name))
    # why can't I say redirect to @topics?
    if @topic.save
      flash[:notice] = "Topic has been saved"
      redirect_to topics_path
    else
      flash[:error] = "There was a problem saving your Topic. Please try again"
      render :new
    end
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  
end
