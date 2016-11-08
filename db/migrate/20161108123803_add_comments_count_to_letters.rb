class AddCommentsCountToLetters < ActiveRecord::Migration[5.0]
  def change
    add_column :letters, :comments_count, :integer
  end
end
