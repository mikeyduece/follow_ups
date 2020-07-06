class Patient < ApplicationRecord
  include Addressable
  include Conversationable

  has_many :addresses, as: :owner

  has_many :care_requests, inverse_of: :patient
  has_many :patient_follow_up_campaigns, dependent: :destroy
  has_many :follow_up_campaigns, through: :patient_follow_up_campaigns

  scope :allowed, -> {
    joins(:patient_follow_up_campaigns).where(patient_follow_up_campaigns: { status: PatientFollowUpCampaign.statuses[:allowed] })
  }

  scope :by_follow_up_interval, ->(count, interval) {
    time_interval = Time.now.utc - count.send(interval)
    joins(:care_requests)
       .where("(care_requests.updated_at BETWEEN :start_at AND :end_at) AND (care_requests.status = :status)",
              end_at: time_interval.end_of_day, start_at: time_interval.beginning_of_day, status: CareRequest.statuses[:complete])
  }

end
