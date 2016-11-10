class ChangeColumnDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :letters, :comments_count, 0
  end
end
