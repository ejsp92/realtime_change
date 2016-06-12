module RealtimeChange
  module Configuration
    class << self
      attr_accessor :redis

      def configure(&block)
        block.call self
      end
    end
  end
end