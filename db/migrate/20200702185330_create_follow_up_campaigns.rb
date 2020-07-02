class CreateFollowUpCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :follow_up_campaigns do |t|
      t.integer :time_frame, default: 0, index: true
      t.timestamps
    end

    change_table :conversation_conversations do |t|
      t.references :follow_up_campaigns, index: true, foreign_key: true
    end
  end
end
