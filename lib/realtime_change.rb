require "realtime_change/version"
require "realtime_change/configuration"
require "realtime_change/model"

module RealtimeChange
  ONLINE_SOCKETS_KEY = 'online-sockets'
  class << self
    def setup(&block)
      Configuration.configure(&block)
    end

    def redis_pub
      Configuration.redis_pub
    end

    def redis_sub
      Configuration.redis_sub
    end

    def is_online(uid)
      redis_pub.sismember(RealtimeChange::ONLINE_SOCKETS_KEY, uid)
    end
  end
end
