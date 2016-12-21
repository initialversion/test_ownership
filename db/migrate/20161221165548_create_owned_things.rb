class CreateOwnedThings < ActiveRecord::Migration
  def change
    create_table :owned_things do |t|
      t.integer :user_id
      t.string :name

      t.timestamps

    end
  end
end
