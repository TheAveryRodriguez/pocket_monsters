require "rails_helper"

RSpec.describe "trainer show" do
  before :each do
    @trainer1 = Trainer.create(name: "Ash", age: 21, leader: true)
    @pocket_monster1 = PocketMonster.create(name: "Pikachu", level: 100, captured: true, trainer_id: @trainer1.id)
    @pocket_monster2 = PocketMonster.create(name: "Charizard", level: 99, captured: true, trainer_id: @trainer1.id)
    @pocket_monster3 = PocketMonster.create(name: "Greninja", level: 98, captured: true, trainer_id: @trainer1.id)
    visit "/trainers/#{@trainer1.id}"
  end

  describe "when i visit a trainers show page" do
    it "I see the trainer with that id including the trainers attributes" do
      expect(page).to have_content("Trainer ID: #{@trainer1.id}")
      expect(page).to have_content("Name: #{@trainer1.name}")
      expect(page).to have_content("Age: #{@trainer1.age}")
      expect(page).to have_content("Leader: #{@trainer1.leader}")
    end
  end

  describe "US 7 - trainers show page" do
    it "I see the count of the number of pocket monsters associated with this parent" do
      expect(page).to have_content("Pocket Monsters Count: 3")
    end
  end

  describe "US 10 - Trainer PM Index Link" do
    describe "when I visit a trainers show page" do
      it "I see a link to take me to that trainers" do
        expect(page).to have_link("This trainer's pocket monsters")

        click_link("This trainer's pocket monsters")

        expect(page).to have_current_path("/trainers/#{@trainer1.id}/pocket_monsters")
      end
    end
  end
end
