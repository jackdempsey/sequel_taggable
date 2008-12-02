module Sequel
  module Plugins
    module Taggable
      # Apply the plugin to the model.
      def self.apply(model, options = {})
        model.class_eval do 
          attr_accessor :tags
        end
      end

      module InstanceMethods
        # Define methods that will be instance-specific here.
        def <<          
        end
      end
      
      module ClassMethods

      end
    end
  end
end
