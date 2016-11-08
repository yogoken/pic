class AddUserIdToLetters < ActiveRecord::Migration[5.0]
  def change
    add_reference :letters, :user, index: true
  end
end

