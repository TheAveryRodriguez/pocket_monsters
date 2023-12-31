require "rails_helper"

RSpec.describe "pocket monsters index page" do
  before :each do
    @trainer1 = Trainer.create(name: "Ash", age: 21, leader: true)
    @pocket_monster1 = PocketMonster.create(name: "Pikachu", level: 100, captured: true, trainer_id: @trainer1.id)
    @pocket_monster2 = PocketMonster.create(name: "Charizard", level: 99, captured: true, trainer_id: @trainer1.id)
    @pocket_monster3 = PocketMonster.create(name: "Greninja", level: 98, captured: true, trainer_id: @trainer1.id)
  end

  describe "when i visit the pocket monsters index" do
    it "I see the name of each pocket monster record in the system" do
      visit "/pocket_monsters"
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

  describe "US 8 - PM Index Link" do
    it "Every page has a link at the top of the page to the Pocket Monsters index" do
      visit "/pocket_monsters"
      expect(page).to have_link("All Pocket Monsters")

      click_link("All Pocket Monsters")

      expect(page).to have_current_path("/pocket_monsters")
    end
  end

  describe "US 15 - Pocket Monster Index" do
    it "only displays records where the boolean column is true" do
      @pocket_monster4 = PocketMonster.create(name: "Mew", level: 1, captured: false, trainer_id: @trainer1.id)

      visit "/pocket_monsters"

      expect(page).to have_content("Name: #{@pocket_monster1.name}")
      expect(page).to have_content("Name: #{@pocket_monster2.name}")
      expect(page).to have_content("Name: #{@pocket_monster3.name}")

      expect(page).to have_no_content("Name: #{@pocket_monster4.name}")
    end
  end

  describe "US 18 - Pocket Monder Update from Index" do
    describe "Edit links are next to every pocket monster" do
      it "I click one I am taken to that pocket monsters edit page where I can update it" do
        visit "/pocket_monsters"

        expect(page).to have_link("Update Pocket Monster #{@pocket_monster1.id}")
        expect(page).to have_link("Update Pocket Monster #{@pocket_monster2.id}")
        expect(page).to have_link("Update Pocket Monster #{@pocket_monster3.id}")

        click_link("Update Pocket Monster #{@pocket_monster2.id}")

        expect(page).to have_current_path("/pocket_monsters/#{@pocket_monster2.id}/edit")

        fill_in "Name", with: "Typhlosian"
        fill_in "Level", with: 100
        fill_in "Captured", with: "true"

        click_button "Submit"

        expect(page).to have_current_path("/pocket_monsters/#{@pocket_monster2.id}")

        expect(page).to have_content("Name: Typhlosian")
        expect(page).to have_content("Level: 100")
        expect(page).to have_content("Captured: true")
      end
    end
  end

  describe "US 23 - Child Delete" do
    describe "Next to every child is a link to delete that child" do
      it "click link, returned to index page and no longer see that child" do
        visit "/pocket_monsters"

        expect(page).to have_link("Delete Pocket Monster #{@pocket_monster1.id}")
        expect(page).to have_link("Delete Pocket Monster #{@pocket_monster2.id}")
        expect(page).to have_link("Delete Pocket Monster #{@pocket_monster3.id}")

        click_link("Delete Pocket Monster #{@pocket_monster2.id}")

        expect(page).to have_current_path("/pocket_monsters")

        expect(page).to have_content("Name: #{@pocket_monster1.name}")
        expect(page).to have_no_content("Name: #{@pocket_monster2.name}")
        expect(page).to have_content("Name: #{@pocket_monster3.name}")
      end
    end
  end
end
