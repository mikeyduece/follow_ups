class BaseService
  attr_reader :params, :patient, :user

  def initialize(params)
    @user = params[:user]
    @patient = params[:patient]
  end

end
