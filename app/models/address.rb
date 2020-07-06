class Address < ApplicationRecord
  belongs_to :owner, polymorphic: true

  geocoded_by :address

  after_validation :geocode

  def address
    [line1, line2, city, state].join(', ')
  end
end
