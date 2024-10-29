class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email, index: true
      t.string :name
      t.string :patronymic
      t.string :nationality
      t.string :country
      t.string :gender
      t.string :user_full_name

      t.integer :age

      t.timestamps
    end
  end
end
