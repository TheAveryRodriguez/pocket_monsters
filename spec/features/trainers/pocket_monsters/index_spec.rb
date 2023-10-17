require "rails_helper"

RSpec.describe "trainer pocket monsters index" do
  before :each do
    @trainer1 = Trainer.create(name: "Ash", age: 21, leader: true)
    @pocket_monster1 = PocketMonster.create(name: "Pikachu", level: 100, captured: true, trainer_id: @trainer1.id)
    @pocket_monster2 = PocketMonster.create(name: "Charizard", level: 99, captured: true, trainer_id: @trainer1.id)
    @pocket_monster3 = PocketMonster.create(name: "Greninja", level: 98, captured: true)
    @pocket_monster4 = PocketMonster.create(name: "Mew", level: 1, captured: true, trainer_id: @trainer1.id)

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

  describe "US 13 - Trainer PM Creation" do
    describe "See and click a link to create a new trainer pocket monster and taken to /trainers/:id/pocket_monsters/new" do
      describe "See a form, fill it out with attributes, and click Create Pocket Monster" do
        it "Post request is sent to '/trainers/:id/pocket_monsters', a new pocket_monster is created for that parent and I am redirected to the trainer pocket monster index page where I see it" do
          expect(page).to have_link("Create Pocket Monster")

          click_link("Create Pocket Monster")

          expect(page).to have_current_path("/trainers/#{@trainer1.id}/pocket_monsters/new")

          fill_in "Name", with: "Mewtwo"
          fill_in "Level", with: 101
          fill_in "Captured", with: "true"

          click_button "Submit"

          expect(page).to have_current_path("/trainers/#{@trainer1.id}/pocket_monsters")

          expect(page).to have_content("Name: Mewtwo")
          expect(page).to have_content("Level: 101")
          expect(page).to have_content("Captured: true")
        end
      end
    end
  end

  describe "US 16 - Sort Trainer PM in alphabetical order" do
    xit "See and click a link to sort children in alphabetical order" do
      save_and_open_page
      expect(page).to have_link("Sort Pocket Monsters")

      click_link("Sort Pocket Monsters")

      expect(page).to have_current_path("/trainers/#{@trainer1.id}/pocket_monsters")

      expect(page).to have_content("Name: #{@pocket_monster2.name}")
      expect(page).to have_content("Name: #{@pocket_monster4.name}")
      expect(page).to have_content("Name: #{@pocket_monster1.name}")
    end
  end

  describe "US 18v2 - Pocket Monder Update from Index" do
    describe "Edit links are next to every pocket monster" do
      it "I click one I am taken to that pocket monsters edit page where I can update it" do
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

  describe "US 21 - Display Records over a given threshold" do
    xit "" do
    end
  end

  describe "US 23v2 - Child Delete" do
    describe "Next to every child is a link to delete that child" do
      it "click link, returned to index page and no longer see that child" do
        expect(page).to have_link("Delete Pocket Monster #{@pocket_monster1.id}")
        expect(page).to have_link("Delete Pocket Monster #{@pocket_monster2.id}")
        expect(page).to have_link("Delete Pocket Monster #{@pocket_monster4.id}")

        click_link("Delete Pocket Monster #{@pocket_monster2.id}")

        expect(page).to have_current_path("/pocket_monsters")

        expect(page).to have_content("Name: #{@pocket_monster1.name}")
        expect(page).to have_no_content("Name: #{@pocket_monster2.name}")
        expect(page).to have_content("Name: #{@pocket_monster4.name}")
      end
    end
  end
end
