class RemoveUserIdToLetters < ActiveRecord::Migration[5.0]
  def change
    remove_column :letters, :user_id
  end
end
