class Conversation < ApplicationRecord
  belongs_to :user
  belongs_to :patient
end
