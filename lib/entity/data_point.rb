require 'entity/base'

module Entity
  class DataPoint < Entity::Base
    def build
      {
        value: @obj.value,
        name: @obj.name,
      }
    end
  end
end
