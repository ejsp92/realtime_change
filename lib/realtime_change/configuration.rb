module RealtimeChange
  module Configuration
    class << self
      attr_accessor :redis_pub
      attr_accessor :redis_sub

      # Whitelist Structure
      # {
      #   ClassName: {
      #     Method: [], <= permitted params in ActionController::Parameters format
      #     OtherMethod: []
      #   },
      #   OtherClass: ...
      # }
      #
      attr_accessor :request_whitelist

      def configure(&block)
        block.call self
      end
    end
  end
end