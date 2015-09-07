class TopicsController < ApplicationController
  def index
    @topics = Topic.all
    authorize @topics
  end

  def new
    @topic = Topic.new
    authorize @topic
  end

  def show
    @topic = Topic.find(params[:id])
    @posts = @topic.posts
    authorize @topic
  end

  def edit
    @topic = Topic.find(params[:id])
    authorize @topic
  end

  def create
    @topic = Topic.new(params.require(:topic).permit(:name, :description, :public))
    authorize @topic
    if @topic.save
      flash[:notice] = "Topic created"
      redirect_to @topic
    else
      flash[:error] = "Woopsie Daisy. Something went wrong."
      render :new
    end
  end

  def update
    @topic = Topic.find(params[:id])
    authorize @topic
    if @topic.update_attributes(params.require(:topic).permit(:name, :description, :public))
      flash[:notice] = "Success!"
      redirect_to @topic
    else
      flash[:error] = "Something went awry. Give it another go!"
      render :edit
    end
  end
end
