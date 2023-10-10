class CreateTrainers < ActiveRecord::Migration[7.0]
  def change
    create_table :trainers do |t|
      t.string :name
      t.integer :age
      t.boolean :leader

      t.timestamps
    end
  end
end
