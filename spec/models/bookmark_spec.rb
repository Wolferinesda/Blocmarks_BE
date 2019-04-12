require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  let(:user) { User.create!(email: "user@blocmarks.com", password: "password") }
  let(:topic) { Topic.create!(title: "Blocmarks Title", user: user) }
  let(:bookmark) { Bookmark.create!(url: "https://example.com", topic: topic) }

  it { is_expected.to validate_presence_of(:url).with_message('must exist') }
  it { is_expected.to validate_presence_of(:topic).with_message('must exist') }
  it { is_expected.to belong_to(:topic) }
  it { should allow_value("https://example.com").for(:url) }

  describe "attributes" do
    it "has url, and topic attributes" do
      expect(bookmark).to have_attributes(url: "https://example.com", topic: topic)
    end
  end
end
