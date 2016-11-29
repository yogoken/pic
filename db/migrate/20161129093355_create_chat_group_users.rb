class CreateChatGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :chat_group_users do |t|
      t.integer :chat_group_id, null: false, index: true
      t.integer :user_id, null: false, index: true
      
      t.timestamps
    end
  end
end
