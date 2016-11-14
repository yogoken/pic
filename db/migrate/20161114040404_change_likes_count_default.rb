class ChangeLikesCountDefault < ActiveRecord::Migration[5.0]
  def change
    change_column_default :comments, :likes_count, 0
  end
end
