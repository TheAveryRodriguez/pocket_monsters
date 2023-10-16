require "rails_helper"

RSpec.describe "pocket monster show" do
  describe "when i visit a pocket monsters show page" do
    it "I see the pocket monster with that id including its attributes" do
      @trainer1 = Trainer.create(name: "Ash", age: 21, leader: true)
      @pocket_monster1 = PocketMonster.create(name: "Pikachu", level: 100, captured: true, trainer_id: @trainer1.id)
      @pocket_monster2 = PocketMonster.create(name: "Charizard", level: 99, captured: true, trainer_id: @trainer1.id)

      visit "/pocket_monsters/#{@pocket_monster1.id}"

      expect(page).to have_content("Pocket Monster ID: #{@pocket_monster1.id}")
      expect(page).to have_content("Name: #{@pocket_monster1.name}")
      expect(page).to have_content("Level: #{@pocket_monster1.level}")
      expect(page).to have_content("Captured: #{@pocket_monster1.captured}")
      expect(page).to have_content("Trainer: #{@pocket_monster1.trainer_id}")
    end
  end

  describe "US 14 - Child Update" do
    describe "See and click a link to update pocket monster and taken to /pocket_monsters/:id/edit" do
      describe "See a form to edit the pocket monster, fill out the attributes, and click submit" do
        it "PATCH request is sent to '/pocket_monsters/:id', pocket monster is updated, and I am redirected to the pocket monsters show page where I see the updated info" do
          expect(page).to have_content("Name: #{@pocket_monster1.name}")
          expect(page).to have_content("Level: #{@pocket_monster1.level}")
          expect(page).to have_content("Captured: #{@pocket_monster1.captured}")

          expect(page).to have_link("Update Pocket Monster")

          click_link("Update Pocket Monster")

          expect(page).to have_current_path("/pocket_monsters/#{@pocket_monster1.id}/edit")

          fill_in "Name", with: "Pichu"
          fill_in "Level", with: 9
          fill_in "Captured", with: "true"

          click_button "Submit"

          expect(page).to have_current_path("/pocket_monsters/#{@pocket_monster1.id}")

          expect(page).to have_content("Name: Pichu")
          expect(page).to have_content("Level: 9")
          expect(page).to have_content("Captured: true")
        end
      end
    end
  end
end
