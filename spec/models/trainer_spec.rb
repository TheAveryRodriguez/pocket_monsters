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

  describe "recently_created" do
    it "should list them in order by most recently created" do
      @trainer1 = Trainer.create(name: "Ash", age: 21, leader: true)
      @trainer2 = Trainer.create(name: "Blue", age: 28, leader: true)
      @trainer3 = Trainer.create(name: "Red", age: 35, leader: true)

      expect(Trainer.recently_created).to eq([@trainer3, @trainer2, @trainer1])
    end
  end
end
