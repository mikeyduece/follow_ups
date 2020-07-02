class Patient < ApplicationRecord
  include Conversationable

  has_many :care_requests, inverse_of: :patient

  scope :by_follow_up_interval, ->(start_at: 1, end_at: 3) {
    joins(:care_requests)
       .where("care_requests.updated_at BETWEEN :end_at AND :start_at",
              end_at: Time.now.utc - end_at.day, start_at: Time.now.utc - start_at.day)
  }
end
