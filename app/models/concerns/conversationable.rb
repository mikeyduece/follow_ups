module Conversationable
  extend ActiveSupport::Concern

  included do
    has_many :conversations, class_name: 'Conversation::Conversation', inverse_of: self.to_s.downcase.to_sym
    has_many :messages, class_name: 'Conversation::Message', through: :conversations, as: :sender
  end
end