require "realtime_change/version"
require "realtime_change/configuration"
require "realtime_change/model"

module RealtimeChange
  ONLINE_SOCKETS_KEY = 'online-sockets'
  class << self
    def setup(&block)
      Configuration.configure(&block)
    end

    def redis
      Configuration.redis
    end

    def is_online(uid)
      Configuration.redis.sismember(RealtimeChange::ONLINE_SOCKETS_KEY, uid)
    end
  end
end
