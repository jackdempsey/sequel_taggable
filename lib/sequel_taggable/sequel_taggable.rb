module Sequel
  module Plugins
    module Taggable
      # Apply the plugin to the model.
      def self.apply(model, options = {})
      end

      module InstanceMethods
        def taggable?
          self.class.taggable?
        end
      end

      module SingletonMethods
        # Class Methods
        def tagged_with(string, options = {})
          tag = Tag.first(:name => string)
          conditions = {}
          conditions[:tag_id] = tag.id
          conditions[:tag_context] = options[:on] if options[:on]
          Tagging.all(conditions).map{|tagging| tagging.taggable}
        end

        def taggable?
          true
        end
      end

      module ClassMethods
        def self.extended(klass)
          klass.has_tags
        end
        
        def has_tags(*args)
          raise "has_tags takes no arguments, use 'has_tags_on :#{args.first}, ...' instead" unless args.empty?
          has_tags_on :tags
        end

        def taggable?
          false
        end
   
        def has_tags_on(*args)
          args.flatten!
          args.uniq!

          self.extend(Sequel::Plugins::Taggable::SingletonMethods)

          args.map{|arg| arg.to_sym}.each do |arg|
              arg_singular = arg.to_s.singularize
                class_eval <<-RUBY
                attr_accessor :frozen_#{arg_singular}_list
                one_to_many :#{arg_singular}_taggings, :class_name => "Tagging", :child_key => [:taggable_id],
                :taggable_type => self.to_s, :tag_context => "#{arg}"
                before_save :update_#{arg}

                def #{arg}
                  #{arg_singular}_taggings.map{|tagging| tagging.tag}
                end

                def #{arg_singular}_list
                  @#{arg_singular}_list || #{arg}.map{|#{arg_singular}| #{arg_singular}.name}.sort
                end

                def #{arg_singular}_list=(string)
                  @#{arg_singular}_list = string.to_s.split(",").map{|name| name.gsub(/[^\\w\\s_-]/i,"").strip}.uniq.sort
                end

                def update_#{arg}
                  return if #{arg_singular}_list.empty?
                  deleted_#{arg} = frozen_#{arg_singular}_list.to_s.split(',') - #{arg_singular}_list
                  deleted_#{arg}.each do |name|
                  tag = Tag.first(:name => name)
                  tagging = #{arg_singular}_taggings.first(:tag_id => tag.id)
                  tagging.destroy
                  #{arg_singular}_taggings.reload
                end
                #{arg_singular}_list.each do |name|
                tag = Tag.first(:name => name)
                next if #{arg}.to_a.include?(tag)
                tag = Tag.create!(:name => name) unless tag
                #{arg_singular}_taggings << Tagging.new(:tag => tag, :taggable_type => self.class.to_s, :tag_context => "#{arg}")
              end
              self.frozen_#{arg_singular}_list = #{arg}.map{|#{arg_singular}| #{arg_singular}.name}.sort.join(',')
            end
            RUBY
            
          end
        end
      end # ClassMethods
    end # Taggable
  end # Plugins
end # Sequel
    