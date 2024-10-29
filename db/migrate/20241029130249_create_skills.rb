class CreateSkills < ActiveRecord::Migration[7.2]
  def change
    create_table :skills do |t|
      t.string :name, index: true

      t.timestamps
    end

    create_table :user_skills do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.references :skill, null: false, foreign_key: true, index: true

      t.timestamps
    end
  end
end
