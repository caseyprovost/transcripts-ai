class CreateChats < ActiveRecord::Migration[8.0]
  def change
    create_table :chats do |t|
      t.string :model_id, null: false
      t.references :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
