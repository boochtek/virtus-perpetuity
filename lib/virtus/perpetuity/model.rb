module Virtus
  module Perpetuity
    module Model
      def self.included(base)
        base.send(:include, Virtus.model)
      end
    end
  end
end
