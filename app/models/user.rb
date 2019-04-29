class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :validatable

  has_many :topics, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes, dependent: :destroy

  validates :password, presence: true, length: { minimum: 6 }
  # validates :email, presence: true, uniqueness: { case_sensitive: true }, length: { minimum: 3, maximum: 254 }

  def liked(bookmark)
    likes.where(bookmark_id: bookmark.id).first
  end
end
