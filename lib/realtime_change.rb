require "realtime_change/version"
require "realtime_change/configuration"
require "realtime_change/model"

module RealtimeChange
  class << self
    def setup(&block)
      Configuration.configure(&block)
    end

    def redis
      Configuration.redis
    end
  end
end
