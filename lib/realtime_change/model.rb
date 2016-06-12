require 'dragonfly/model/instance_methods'
require 'dragonfly/model/class_methods'

module RealtimeChange
  module Model
    def self.extended(klass)
      klass.extend(ClassMethods)
      klass.class_eval{ include InstanceMethods }
    end
  end
end