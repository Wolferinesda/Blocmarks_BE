class IncomingController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]

  def create
    @user = User.find_by(email: params[:sender])
    @topic = Topic.find_by(user_id: @user, title: params[:subject])
    @url = params["body-plain"]

    if @user.nil?
      @user = User.create!(email: params[:sender], password: 'password')
    end

    if @topic.nil?
      @topic = Topic.create!((title: params[:title], user: @user))
    end

    Bookmark.create!(
      url: @url,
      topic: @topic
    )

  end

  head 200
end
