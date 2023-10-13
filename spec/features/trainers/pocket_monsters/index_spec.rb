require "rails_helper"

RSpec.describe "trainer pocket monsters index" do
  before :each do
    @trainer1 = Trainer.create(name: "Ash", age: 21, leader: true)
    @pocket_monster1 = PocketMonster.create(name: "Pikachu", level: 100, captured: true, trainer_id: @trainer1.id)
    @pocket_monster2 = PocketMonster.create(name: "Charizard", level: 99, captured: true, trainer_id: @trainer1.id)
    @pocket_monster3 = PocketMonster.create(name: "Greninja", level: 98, captured: true)

    visit "/trainers/#{@trainer1.id}/pocket_monsters"
  end

  describe "US 5- when i visit /trainers/:trainer_id/pocket_monsters" do
    it "I see each pocket monster record associated with that trainer" do
      expect(page).to have_content("Name: #{@pocket_monster1.name}")
      expect(page).to have_content("Level: #{@pocket_monster1.level}")
      expect(page).to have_content("Captured: #{@pocket_monster1.captured}")

      expect(page).to have_content("Name: #{@pocket_monster2.name}")
      expect(page).to have_content("Level: #{@pocket_monster2.level}")
      expect(page).to have_content("Captured: #{@pocket_monster2.captured}")

      expect(page).to have_no_content("Name: #{@pocket_monster3.name}")
    end
  end
end
