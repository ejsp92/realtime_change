module RealtimeChange
  module Model
    module ClassMethods
      private
      def notifiable_in_realtime
        after_create :notify_create if respond_to?(:after_create)
        after_update :notify_update if respond_to?(:after_update)
        after_destroy :notify_destroy if respond_to?(:after_destroy)

        # Define an anonymous module for all of the instance methods.
        instance_methods = Module.new do
          def json_to_send
            self.to_json
          end

          def send_to
            []
          end

          def notify_create
            message = {
              type: 'change',
              action: 'create',
              resource: self.class.name,
              resource_content: json_to_send,
              send_to: send_to
            }
            notify message
          end

          def notify_update
            message = {
              type: 'change',
              action: 'update',
              resource: self.class.name,
              resource_content: json_to_send,
              send_to: send_to
            }
            notify message
          end

          def notify_destroy
            message = {
              type: 'change',
              action: 'destroy',
              resource: self.class.name,
              resource_content: json_to_send,
              send_to: send_to
            }
            notify message
          end

          def notify(message)
            RealtimeChange.redis.publish 'server-message', message
          end
        end

        include instance_methods
      end
    end
  end
end