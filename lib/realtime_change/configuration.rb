module RealtimeChange
  module Configuration
    class << self
      attr_accessor :redis

      def configure
        yield self
      end
    end
  end
end