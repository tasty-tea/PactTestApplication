class RenameSkillsTableToSkils < ActiveRecord::Migration[7.2]
  def change
    rename_table :skills, :skils
    rename_table :user_skills, :user_skils
  end
end
