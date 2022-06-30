class Secret < ApplicationRecord
  def self.instance
    first_or_create
  end

  before_create do |record|
    if self.class.count != 0
      raise StandardError.new("You must use the `instance` class method to retrieve data from the Secret class")
    end
  end

  before_save do |record|
    if self.class.count > 0 && record.id != self.class.instance.id
      raise StandardError.new("You must use the `instance` class method to retrieve data from the Secret class")
    end
  end
end
