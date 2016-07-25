# require 'realtime_change/tasks'
# will give you the resque tasks

namespace :realtime_change do

	#
	# Message Structure
	# {
	#   ClassName: {
	#      action: "MethodName",
	#      params: "JSON/Hash"
	#   }
	# }
	#

  task subscribe: :environment do

    RealtimeChange.redis_sub.subscribe("client-message") do |on|
      on.message do |channel, message|
        Rails.logger.info("Message on channel #{channel}: #{message}")
        begin
				  message = JSON.parse(message, symbolize_names: true)
				  whitelist = RealtimeChange::Configuration.request_whitelist.with_indifferent_access
				  resource_whitelist = whitelist.keys.map(&:to_sym)
				  
				  resource = ( message.keys & resource_whitelist ).first
				  resource_method = message[resource][:action].to_sym

				  if resource.present? && whitelist[resource].keys.map(&:to_sym).include?( resource_method )

				  	allowed_params = whitelist[resource][resource_method]
				  	params = ActionController::Parameters.new( message[resource][:params] ).permit( allowed_params )

				  	resource_class = resource.to_s.constantize
				  	resource_class.send resource_method, params

				  	Rails.logger.info("Request resolved for Class #{resource_class}, Method #{resource_method} and Parameters #{params}")
				  end
				rescue => e
					Rails.logger.error("Message error: #{e}")
				end
      end
    end

  end

end