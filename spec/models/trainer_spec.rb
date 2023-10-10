require "rails_helper"

RSpec.describe Trainer, type: :model do
  describe "relationships" do
    it { should have_many :pocket_monsters }
  end

  describe "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:age) }
    it { should validate_presence_of(:leader) }
  end
end
