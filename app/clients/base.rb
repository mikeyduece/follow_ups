class Base
  attr_reader :patient, :user

  def initialize(patient:, user: nil)
    @patient = patient
    @user = user
  end

end
