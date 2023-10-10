require "rails_helper"

RSpec.describe PocketMonster, type: :model do
  describe "relationships" do
    it { should belong_to :trainer }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:level) }
    it { should validate_presence_of(:captured) }
  end
end
