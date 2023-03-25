class User < ApplicationRecord
  has_many :sleep_qualities
  validate :validate_hashed_pin

  def matches_pin?(pin)
    hashed_pin == self.class.hash_pin(pin)
  end

  def self.hash_pin(pin)
    Digest::SHA2.hexdigest(pin.to_s)
  end

  def validate_hashed_pin
    unless hashed_pin.present?
      errors.add(:hashed_pin, 'must be present')
    end
  end
end

