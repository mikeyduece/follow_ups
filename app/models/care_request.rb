class CareRequest < ApplicationRecord
  belongs_to :patient
  belongs_to :user
end
