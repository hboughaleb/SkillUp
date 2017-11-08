class AddUserReferenceToSkills < ActiveRecord::Migration[5.0]
  def change
    add_reference :skills, :user, foreign_key: true, index: true
  end
end
