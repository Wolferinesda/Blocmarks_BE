class BookmarkPolicy
  attr_reader :user, :bookmark

  def initialize(user, bookmark)
    @user = user
    @bookmark = bookmark
  end

  def create?
    user.present?
  end

  def edit?
    update?
  end

  def update?
    user.present? && (User.find(Topic.find(bookmark.topic_id).user_id) == user)
  end

  def destroy?
    user.present? && (User.find(Topic.find(bookmark.topic_id).user_id) == user)
  end
end
