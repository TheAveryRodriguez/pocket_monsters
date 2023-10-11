require "rails_helper"

RSpec.describe "trainer index page" do
  describe "when i visit the trainers index" do
    it "I see the name of each trainer record in the system" do
      @trainer1 = Trainer.create(name: "Ash", age: 21, leader: true)
      @trainer2 = Trainer.create(name: "Blue", age: 28, leader: true)

      visit "/trainers"

      expect(page).to have_content("Name: #{@trainer1.name}")
      expect(page).to have_content("Name: #{@trainer2.name}")
    end
  end
end
