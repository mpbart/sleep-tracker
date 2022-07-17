require 'entity/base'

module Entity
  class User < Entity::Base
    def build
      {
        username: @obj.username,
        first_name: @obj.first_name,
        last_name: @obj.last_name,
      }
    end

    def self.activerecord_class
      ::User
    end

    def matches_pin?(pin)
      return false unless @obj

      @obj.matches_pin?(pin)
    end
  end
end
