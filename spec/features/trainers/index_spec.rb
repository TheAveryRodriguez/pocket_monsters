require "rails_helper"

RSpec.describe "trainer index page" do
  before :each do
    @trainer1 = Trainer.create(name: "Ash", age: 21, leader: true)
    @trainer2 = Trainer.create(name: "Blue", age: 28, leader: true)
    @trainer3 = Trainer.create(name: "Red", age: 35, leader: true)

    visit "/trainers"
  end

  describe "when i visit the trainers index" do
    it "I see the name of each trainer record in the system" do
      expect(page).to have_content("Name: #{@trainer1.name}")
      expect(page).to have_content("Name: #{@trainer2.name}")
    end
  end

  describe "US6 - Sorted Records" do
    it "Sorts trainers by most recently created & displays their created_at" do
      expect(page).to have_content("Name: #{@trainer1.name}")
      expect(page).to have_content("Name: #{@trainer2.name}")
      expect(page).to have_content("Name: #{@trainer3.name}")
    end
  end

  describe "US 9 - Trainer Index Link" do
    it "Every page has a link at the top of the page to the Trainers index" do
      expect(page).to have_link("All Trainers")

      click_link("All Trainers")

      expect(page).to have_current_path("/trainers")
    end
  end

  describe "US 11 - Trainer Creation" do
    describe "See and click a link to create a new trainer and taken to /trainers/new" do
      describe "See a form, fill it out with attributes, and click Create Trainer" do
        it "Post request is sent, a new trainer is created and I am redirected to the trainer index page where I see it" do
          expect(page).to have_link("Create New Trainer")

          click_link("Create New Trainer")

          expect(page).to have_current_path("/trainers/new")

          fill_in "Name", with: "Gary"
          fill_in "Age", with: 18
          fill_in "Leader", with: "true"

          click_button "Submit"

          expect(page).to have_current_path("/trainers")
          expect(page).to have_content("Name: Gary")
        end
      end
    end
  end

  describe "US 17 - Trainer Update from Index" do
    describe "Edit links are next to every trainer" do
      it "I click one I am taken to that trainers edit page where I can update it" do
        expect(page).to have_link("Update Trainer #{@trainer1.id}")
        expect(page).to have_link("Update Trainer #{@trainer2.id}")
        expect(page).to have_link("Update Trainer #{@trainer3.id}")

        click_link("Update Trainer #{@trainer2.id}")

        expect(page).to have_current_path("/trainers/#{@trainer2.id}/edit")

        fill_in "Name", with: "Azul"
        fill_in "Age", with: 38
        fill_in "Leader", with: "true"

        click_button "Submit"

        expect(page).to have_current_path("/trainers/#{@trainer2.id}")

        expect(page).to have_content("Name: Azul")
        expect(page).to have_content("Age: 38")
        expect(page).to have_content("Leader: true")
      end
    end
  end

  describe "US 22 - Parent Delete" do
    describe "Next to every parent is a link to delete that parent" do
      it "click link, returned to index page and no longer see that parent" do
        expect(page).to have_link("Delete Trainer #{@trainer1.id}")
        expect(page).to have_link("Delete Trainer #{@trainer2.id}")
        expect(page).to have_link("Delete Trainer #{@trainer3.id}")

        click_link("Delete Trainer #{@trainer2.id}")

        expect(page).to have_current_path("/trainers")

        expect(page).to have_content("Name: #{@trainer1.name}")
        expect(page).to have_no_content("Name: #{@trainer2.name}")
        expect(page).to have_content("Name: #{@trainer3.name}")
      end
    end
  end
end
