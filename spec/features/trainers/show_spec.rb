require "rails_helper"

RSpec.describe "trainer show" do
  describe "when i visit a trainers show page" do
    it "I see the trainer with that id including the trainers attributes" do
      @trainer1 = Trainer.create(name: "Ash", age: 21, leader: true)
      @trainer2 = Trainer.create(name: "Blue", age: 28, leader: true)

      visit "/trainers/#{@trainer1.id}"

      expect(page).to have_content("Trainer ID: #{@trainer1.id}")
      expect(page).to have_content("Name: #{@trainer1.name}")
      expect(page).to have_content("Age: #{@trainer1.age}")
      expect(page).to have_content("Leader: #{@trainer1.leader}")
    end
  end
end
