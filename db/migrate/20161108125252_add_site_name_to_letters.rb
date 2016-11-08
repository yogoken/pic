class AddSiteNameToLetters < ActiveRecord::Migration[5.0]
  def change
    add_column :letters, :site_name, :string
  end
end
