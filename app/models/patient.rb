class Patient < ApplicationRecord
  include Conversationable

  has_many :care_requests, inverse_of: :patient
  has_many :patient_follow_up_campaigns, dependent: :destroy
  has_many :follow_up_campaigns, through: :patient_follow_up_campaigns

  scope :by_follow_up_interval, ->(count, interval) {
    time_interval = Time.now.utc - count.send(interval)
    joins(:care_requests)
       .where("care_requests.updated_at BETWEEN :end_at AND :start_at",
              end_at: time_interval.send("end_of_#{interval}"), start_at: time_interval.send("beginning_of_#{interval}"))
  }
end
