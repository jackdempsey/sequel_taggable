module Sequel
  module Plugins
    module Taggable
      # Apply the plugin to the model.
      def self.apply(model, options = {})
        model.send(:include, InstanceMethods)
      end

      module InstanceMethods
        # Define methods that will be instance-specific here.
      end
    end
  end
end
