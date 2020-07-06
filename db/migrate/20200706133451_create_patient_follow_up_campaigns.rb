class CreatePatientFollowUpCampaigns < ActiveRecord::Migration[6.0]
  def change
    create_table :patient_follow_up_campaigns do |t|
      t.references :patient, null: false, foreign_key: true
      t.references :follow_up_campaign, null: false, foreign_key: true
      t.integer :status, default: 0, index: true

      t.timestamps
    end

    add_index :patient_follow_up_campaigns, %i[patient_id follow_up_campaign_id], name: :idx_patient_follow_ups_on_patient_and_campaign
  end
end
