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
          def resource_content
            self.attributes
          end

          def recipient_uids
            []
          end

          def notify_create
            message = {
              type: 'change',
              action: 'create',
              resource: self.class.name,
              resource_content: resource_content,
              recipient_uids: recipient_uids
            }

            notify message
          end

          def notify_update
            message = {
              type: 'change',
              action: 'update',
              resource: self.class.name,
              resource_content: resource_content,
              recipient_uids: recipient_uids
            }

            notify message
          end

          def notify_destroy
            message = {
              type: 'change',
              action: 'destroy',
              resource: self.class.name,
              resource_content: resource_content,
              recipient_uids: recipient_uids
            }

            notify message
          end

          def notify(message)
            RealtimeChange.redis_pub.publish 'server-message', message.to_json
          end
        end

        include instance_methods
      end
    end
  end
end