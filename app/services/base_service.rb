class BaseService
  attr_reader :count, :interval, :name

  def initialize(count, interval, name)
    @count = count
    @interval = interval
    @name = name
  end

end
