class BaseService
  attr_reader :count, :interval, :name

  def self.call(count, interval, name)
    new(count, interval, name).call
  end

  def initialize(count, interval, name)
    @count = count
    @interval = interval
    @name = name
  end

  private_class_method :new

end
