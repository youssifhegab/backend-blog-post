class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :entity_id
      t.string :entity_type
      t.integer :user_id

      t.timestamps
    end

    add_index :likes, [:entity_id, :entity_type]
    add_index :likes, :user_id
  end
end
