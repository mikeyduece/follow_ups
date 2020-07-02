module Conversation
  class Message < ApplicationRecord
    belongs_to :sender, polymorphic: true
    belongs_to :conversation, inverse_of: :messages
  end
end