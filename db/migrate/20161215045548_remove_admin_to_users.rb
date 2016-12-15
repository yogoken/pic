class RemoveAdminToUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :admin, :string
  end
end
