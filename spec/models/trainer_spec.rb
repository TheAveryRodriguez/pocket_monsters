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

  before :each do
    @trainer1 = Trainer.create(name: "Ash", age: 21, leader: true)
    @trainer2 = Trainer.create(name: "Blue", age: 28, leader: true)
    @trainer3 = Trainer.create(name: "Red", age: 35, leader: true)

    @pocket_monster1 = PocketMonster.create(name: "Pikachu", level: 100, captured: true, trainer_id: @trainer1.id)
    @pocket_monster2 = PocketMonster.create(name: "Charizard", level: 99, captured: true, trainer_id: @trainer1.id)
    @pocket_monster3 = PocketMonster.create(name: "Greninja", level: 98, captured: true, trainer_id: @trainer2.id)
    @pocket_monster4 = PocketMonster.create(name: "Mew", level: 1, captured: true, trainer_id: @trainer2.id)
    @pocket_monster5 = PocketMonster.create(name: "Snorlax", level: 2, captured: true, trainer_id: @trainer3.id)
    @pocket_monster6 = PocketMonster.create(name: "Squirtle", level: 3, captured: true, trainer_id: @trainer3.id)
  end

  describe "recently_created" do
    it "should list them in order by most recently created" do
      expect(Trainer.recently_created).to eq([@trainer3, @trainer2, @trainer1])
    end
  end

  describe "monsters_count" do
    it "should tell me the trainers pocket monster count" do
      expect(@trainer1.monsters_count).to eq(2)
      expect(@trainer2.monsters_count).to eq(2)
      expect(@trainer3.monsters_count).to eq(2)
    end
  end

  describe "alphabetical_monsters" do
    it "should list pocket monsters by name alphabetically" do
      expect(@trainer1.alphabetical_monsters).to eq([@pocket_monster2, @pocket_monster1])
      expect(@trainer2.alphabetical_monsters).to eq([@pocket_monster3, @pocket_monster4])
      expect(@trainer3.alphabetical_monsters).to eq([@pocket_monster5, @pocket_monster6])
    end
  end

  describe "stronger_than(threshold)" do
    it "should list them in order by most recently created" do
      expect(@trainer2.stronger_than(3)).to eq([@pocket_monster3])
    end
  end
end
