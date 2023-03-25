require 'entity/base'

module Entity
  class User < Entity::Base
    MODEL_ATTRIBUTES = [:username, :first_name, :last_name].freeze
    PRIVATE_ATTRIBUTES = [:pin].freeze

    def build
      {
        id:         @obj.id,
        username:   @obj.username,
        first_name: @obj.first_name,
        last_name:  @obj.last_name,
      }
    end

    def self.activerecord_class
      ::User
    end

    def matches_pin?(pin)
      return false unless @obj

      @obj.matches_pin?(pin)
    end

    def self.from_hash(hash)
      instance = new(activerecord_class.new(hash.slice(*MODEL_ATTRIBUTES)))
      instance.instance_variable_get(:@obj).hashed_pin = activerecord_class.hash_pin(hash[:pin])
      instance
    end
  end
end
