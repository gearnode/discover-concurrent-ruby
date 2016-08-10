require 'concurrent'

class HardWorker
  include Concurrent::Async

  def self.perform_async(*args)
    new(*args).async.hello
  end

  def initialize(name:)
    @name = name.freeze
  end

  def hello
    sleep(3)
    greating = "Hello #{@name}"
    puts greating
    greating
  end

end

res = HardWorker.perform_async(name: 'Gearnode')

