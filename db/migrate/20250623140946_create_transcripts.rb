class CreateTranscripts < ActiveRecord::Migration[8.0]
  def change
    create_table :transcripts do |t|
      t.text :body, null: false
      t.belongs_to :user, null: true, foreign_key: true

      t.timestamps
    end
  end
end
