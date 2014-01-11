require 'perpetuity'

module Virtus
  module Perpetuity
    module Model
      def self.included(base)
        base.send(:include, Virtus.model)
        base.send(:extend, Virtus::Perpetuity::Model::AttributeDeclarations)
        ::Perpetuity.generate_mapper_for(base)
      end

      module AttributeDeclarations
        def attribute(name, type, options = {})
          super
          add_attribute_to_mapper(name, options, type)
        end

        def add_attribute_to_mapper(name, options, type)
          ::Perpetuity.mapper_registry[self].attribute_set << ::Perpetuity::Attribute.new(name, type, options)
        end
      end
    end
  end
end
