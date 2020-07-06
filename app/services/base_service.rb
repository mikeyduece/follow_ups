class BaseService
  attr_reader :params, :user

  def initialize(params)
    @user = params[:user]
  end

end
