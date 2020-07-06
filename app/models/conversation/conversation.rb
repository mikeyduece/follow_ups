module Conversation
  class Conversation < ApplicationRecord
    belongs_to :follow_up_campaign, inverse_of: :conversations
    belongs_to :user, inverse_of: :conversations
    belongs_to :patient, inverse_of: :conversations

    has_many :messages, class_name: 'Conversation::Message', inverse_of: :conversation
  end
end
