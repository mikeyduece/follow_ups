class User < ApplicationRecord
  include Conversationable

  has_many :care_requests, inverse_of: :user
  has_many :patient_follow_up_campaigns, dependent: :destroy
  has_many :patient_follow_ups, class_name: 'Patient', through: :patient_follow_up_campaigns
end
