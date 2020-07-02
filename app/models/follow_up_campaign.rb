class FollowUpCampaign < ApplicationRecord
  has_many :conversations, class_name: 'Conversation::Conversation', inverse_of: :follow_up_campaign

  validates :name, presence: true
end
