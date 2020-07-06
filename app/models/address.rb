class Address < ApplicationRecord
  belongs_to :owner, polymorphic: true

  geocoded_by :address

  after_validation :geocode, if: ->(obj) { obj.fields_changed? }

  def address
    [line1, line2, city, state].join(', ')
  end

  def fields_changed?
    (line1.present? && line1_changed?) ||
       (line2.present? && line2_changed?) ||
       (city.present? && city_changed?) ||
       (state.present? && state_changed?)
  end
end
