class Bookmark < ApplicationRecord
  belongs_to :topic

  validates :url, length: { minimum: 5 }, presence: true
end
