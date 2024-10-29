class CreateInterests < ActiveRecord::Migration[7.2]
  def change
    create_table :interests do |t|
      t.string :name, index: true

      t.timestamps
    end

    create_table :user_interests do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :interest, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
