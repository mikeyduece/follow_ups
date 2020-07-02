class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :conversation_messages do |t|
      t.references :sender, null: false, polymorphic: true
      t.references :conversation, null: false
      t.string :content

      t.timestamps
    end

    add_foreign_key :conversation_messages, :conversation_conversations, column: :conversation_id
    add_index :conversation_messages, %i[sender_id sender_type conversation_id], name: :idx_conversation_message_on_sender_and_conversation
  end
end
