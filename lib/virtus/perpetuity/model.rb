require 'perpetuity'

module Virtus
  module Perpetuity
    module Model
      def self.included(base)
        base.send(:include, Virtus.model)
        ::Perpetuity.generate_mapper_for base do
          # TODO: Declare attributes.
        end
      end
    end
  end
end
