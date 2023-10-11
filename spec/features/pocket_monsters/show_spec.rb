require "rails_helper"

RSpec.describe "pocket monster show" do
  describe "when i visit a pocket monsters show page" do
    it "I see the pocket monster with that id including its attributes" do
      @trainer1 = Trainer.create(name: "Ash", age: 21, leader: true)
      @pocket_monster1 = PocketMonster.create(name: "Pikachu", level: 100, captured: true, trainer_id: @trainer1.id)
      @pocket_monster2 = PocketMonster.create(name: "Charizard", level: 99, captured: true, trainer_id: @trainer1.id)

      visit "/pocket_monsters/#{@pocket_monster1.id}"

      save_and_open_page

      expect(page).to have_content("Pocket Monster ID: #{@pocket_monster1.id}")
      expect(page).to have_content("Name: #{@pocket_monster1.name}")
      expect(page).to have_content("Level: #{@pocket_monster1.level}")
      expect(page).to have_content("Captured: #{@pocket_monster1.captured}")
      expect(page).to have_content("Trainer: #{@pocket_monster1.trainer_id}")
    end
  end
end
