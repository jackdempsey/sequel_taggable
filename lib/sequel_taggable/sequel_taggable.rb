module Sequel
  module Plugins
    module Taggable
      # Apply the plugin to the model.
      def self.apply(model, options = {})
        model.class_eval %{
          is :polymorphic
          has_many :taggings, :as => :taggable
          many_to_many :tags, :through => :taggings, :as => :taggable
        }
      end

      module InstanceMethods
      end

      module ClassMethods
      end # ClassMethods
    end # Taggable
  end # Plugins
end # Sequel
    