class Bookmark < ApplicationRecord
  belongs_to :topic
  has_many :likes, dependent: :destroy

  validates :url, length: { minimum: 5 }, presence: true
end
