class CareRequest < ApplicationRecord
  belongs_to :patient, inverse_of: :care_requests
  belongs_to :user, inverse_of: :care_requests

  enum status: %i[requested en_route complete]
end
