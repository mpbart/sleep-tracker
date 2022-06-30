class User < ApplicationRecord
  has_many :sleep_qualities

  def matches_pin?(pin)
    hashed_pin == self.class.hash_pin(pin)
  end

  def self.hash_pin(pin)
    Digest::SHA2.hexdigest(pin.to_s)
  end
end

