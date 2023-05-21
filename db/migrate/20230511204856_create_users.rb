class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false, default: "", index: { unique: true }
      t.string :first_name, null: false, default: ""
      t.string :last_name, null: false, default: ""
      t.date :birth_date, null: false, default: ""
      t.string :password_digest
      t.binary :profile_picture

      t.timestamps
    end
  end
end
