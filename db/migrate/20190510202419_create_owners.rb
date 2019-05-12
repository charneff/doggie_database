class CreateOwners < ActiveRecord::Migration[5.2]
  def change
    create_table :owners do |t|
      t.string :owner_name
      t.string :email
      t.string :password_digest
    end
  end
end
