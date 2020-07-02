class User < ApplicationRecord
  include Conversationable

  has_many :care_requests, inverse_of: :user
end
