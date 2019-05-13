class CreateDogs < ActiveRecord::Migration[5.2]
  def change
    create_table :dogs do |t|
      t.string :name
      t.string :breed
      t.string :age
      t.boolean :fixed
      t.string :gender
      t.integer :owner_id
    end
  end
end
