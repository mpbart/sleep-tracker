module Entity
  class Base
    class RecordNotFoundError < StandardError; end

    def build
      Rails.logger.warn("Attempting to build an entity from #{self.class.name} without a defined build method")
      {}
    end

    def persist!
      @obj.save!
    end

    def [](key)
      @built_obj[key]
    end

    def []=(key, value)
      @built_obj[key] = value
    end

    def set_association(association_pkey, value)
      @obj.send("#{association_pkey}=", value)
    end

    def self.find_by(**attributes)
      begin
        new(activerecord_class.find_by!(**attributes))
      rescue ActiveRecord::RecordNotFound
        raise Entity::Base::RecordNotFoundError.new("No record found with #{attributes}")
      end
    end

    # Should only be called directly by the repository
    def self.from_database_record(record)
      new(record)
    end

    def self.from_hash(hash)
      new(activerecord_class.new(**hash))
    end

    private

    def initialize(obj)
      @obj = obj
      @built_obj = build
    end
  end
end
