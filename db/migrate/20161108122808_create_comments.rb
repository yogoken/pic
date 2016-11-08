class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user, index: true, foreign_key: true
      t.references :letter, index: true, foreign_key: true

      t.timestamps
    end
  end
end
