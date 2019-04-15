# coding: utf-8
class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      flash[:notice] = "Topic: \"#{@topic.title.capitalize}\" was saved successfully! :)"
      redirect_to @topic
    else
      flash[:alert] = "There was an error saving your topic.  Please try again."
      render :new
    end
  end

  def new
    @topic = Topic.new
    @topic.user = current_user
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])

    @topic.assign_attributes(topic_params)

    if @topic.save
      flash[:notice] = "Topic: \"#{@topic.title.capitalize}\" was updated"
      redirect_to @topic
    else
      flash[:error] = "There was an error saving the topic. Please try again."
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])

    if @topic.destroy
      flash[:notice] = "Topic: \"#{@topic.title.capitalize}\" was deleted successfully."
      redirect_to topics_path
    else
      flash[:error] = "There was an error deleting the topic."
      render :show
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:title)
  end
end
