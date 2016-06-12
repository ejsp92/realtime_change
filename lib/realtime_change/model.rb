require 'realtime_change/model/instance_methods'
require 'realtime_change/model/class_methods'

module RealtimeChange
  module Model
    def self.extended(klass)
      klass.extend(ClassMethods)
      klass.class_eval{ include InstanceMethods }
    end
  end
end