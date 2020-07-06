class PatientFollowUpCampaign < ApplicationRecord
  belongs_to :patient
  belongs_to :follow_up_campaign

  enum status: %i[allowed stop]
end
