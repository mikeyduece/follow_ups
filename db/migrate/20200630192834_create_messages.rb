class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.references :sender, null: false, polymorphic: true
      t.references :conversation, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end

    add_index :messages, %i[sender_id sender_type conversation_id]
  end
end
