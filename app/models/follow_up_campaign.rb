class FollowUpCampaign < ApplicationRecord
  has_many :conversations, class_name: 'Conversation::Conversation', inverse_of: :follow_up_campaign
  has_many :patient_follow_up_campaigns, dependent: :destroy
  has_many :patients, through: :patient_follow_up_campaigns

  validates :name, presence: true

  def default_message
    <<-STRING
      Hello! This is DispatchHealth, following up on our recent visit. 
      If you are not the patient, or you feel this was sent in error, reply “STOP.” 
      Do you have any questions that have come up since we saw you? Can we help you in any way?
    STRING
  end
end
