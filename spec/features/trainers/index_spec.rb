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
end
