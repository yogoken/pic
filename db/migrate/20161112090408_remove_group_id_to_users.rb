class RemoveGroupIdToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :group_id, :integer
  end
end
