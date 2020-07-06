class BaseService
  attr_reader :start_at, :end_at, :name

  def initialize(start_at, end_at, name)
    @start_at = start_at
    @end_at = end_at
    @name = name
  end

end
