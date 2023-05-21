class CreateLikables < ActiveRecord::Migration[7.0]
  def change
    create_table :likables do |t|
      t.references :likable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
