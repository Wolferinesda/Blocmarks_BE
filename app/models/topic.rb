class Topic < ApplicationRecord
  belongs_to :user
  has_many :bookmarks

  validates :title, length: { minimum: 5 }, presence: true
  validates :user, presence: true
end
