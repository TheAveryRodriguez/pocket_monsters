require "rails_helper"

RSpec.describe "pocket monsters index page" do
  before :each do
    @trainer1 = Trainer.create(name: "Ash", age: 21, leader: true)
    @pocket_monster1 = PocketMonster.create(name: "Pikachu", level: 100, captured: true, trainer_id: @trainer1.id)
    @pocket_monster2 = PocketMonster.create(name: "Charizard", level: 99, captured: true, trainer_id: @trainer1.id)

    visit "/pocket_monsters"
  end

  describe "when i visit the pocket monsters index" do
    it "I see the name of each pocket monster record in the system" do
      expect(page).to have_content("Name: #{@pocket_monster1.name}")
      expect(page).to have_content("Level: #{@pocket_monster1.level}")
      expect(page).to have_content("Captured: #{@pocket_monster1.captured}")
      expect(page).to have_content("Trainer: #{@pocket_monster1.trainer_id}")

      expect(page).to have_content("Name: #{@pocket_monster2.name}")
      expect(page).to have_content("Level: #{@pocket_monster2.level}")
      expect(page).to have_content("Captured: #{@pocket_monster2.captured}")
      expect(page).to have_content("Trainer: #{@pocket_monster2.trainer_id}")
    end
  end

  describe "US 8 - Child Index Link" do
    it "Every page has a link at the top of the page to the Pocket Monsters index" do
      save_and_open_page
      expect(page).to have_link("All Pocket Monsters")
    end
  end
end
