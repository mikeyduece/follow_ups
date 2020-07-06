module Addressable

  def default_address
    addresses.find_by(default: true)
  end

end