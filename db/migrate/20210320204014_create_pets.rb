class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.string :name, null: false
      t.string :breed
      t.date :birthday, start_year: 1980

      t.timestamps
    end
  end
end
