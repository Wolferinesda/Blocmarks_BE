require 'rails_helper'

RSpec.describe Topic, type: :model do
  let (:user) { User.create!( email: "user@blocmarks.com", password: "password") }
  let (:topic) { Topic.create!(title: "Blocmarks Title", user: user) }

  it { is_expected.to validate_presence_of(:title).with_message('must exist') }
  it { is_expected.to validate_presence_of(:user).with_message('must exist') }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:bookmarks) }

  describe "attributes" do
    it "has title and user attributes" do
      expect(topic).to have_attributes(title: "Blocmarks Title", user: user)
    end
  end
end
