require "rails_helper"

RSpec.describe "trainer show" do
  before :each do
    @trainer1 = Trainer.create(name: "Ash", age: 21, leader: true)
    @trainer2 = Trainer.create(name: "Blue", age: 28, leader: true)
    @trainer3 = Trainer.create(name: "Red", age: 35, leader: true)
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

  describe "US 12 - Parent Update" do
    describe "See and click a link to update trainer and taken to /trainers/:id/edit" do
      describe "See a form to edit the trainer, fill out the attributes, and click Update" do
        it "PATCH request is sent to '/trainers/:id', trainer is updated, and I am redirected to the trainers show page where I see the updated info" do
          expect(page).to have_content("Name: #{@trainer1.name}")
          expect(page).to have_content("Age: #{@trainer1.age}")
          expect(page).to have_content("Leader: #{@trainer1.leader}")

          expect(page).to have_link("Update Trainer")

          click_link("Update Trainer")

          expect(page).to have_current_path("/trainers/#{@trainer1.id}/edit")

          fill_in "Name", with: "Ashe"
          fill_in "Age", with: 18
          fill_in "Leader", with: "true"

          click_button "Submit"

          expect(page).to have_current_path("/trainers/#{@trainer1.id}")

          expect(page).to have_content("Name: #{@trainer1.name}")
          expect(page).to have_content("Age: 18")
          expect(page).to have_content("Leader: #{@trainer1.leader}")
        end
      end
    end
  end

  describe "US 19 - Parent Delete" do
    describe "link to delete a trainer, click it, trainer is deleted and all child records are deleted" do
      xit "redirected back to index and no longer see that trainer" do
        save_and_open_page
        expect(page).to have_link("Delete Trainer")

        click_link("Delete Trainer")

        expect(page).to have_current_path("/trainers")

        expect(page).to have_no_content("Name: #{@trainer1.name}")
        expect(page).to have_content("Name: #{@trainer2.name}")
        expect(page).to have_content("Name: #{@trainer3.name}")
      end
    end
  end
end
