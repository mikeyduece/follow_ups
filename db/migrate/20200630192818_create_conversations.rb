class CreateConversations < ActiveRecord::Migration[6.0]
  def change
    create_table :conversation_conversations do |t|
      t.references :user, null: false, foreign_key: true
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end

    add_index :conversation_conversations, %i[user_id patient_id]
  end
end
