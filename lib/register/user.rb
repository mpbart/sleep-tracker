require 'entity/user'

module Register
  class User
    def self.register!(first_name:, last_name:, username:, pin:)
      begin
        user = Entity::User.from_hash(
          first_name: first_name,
          last_name: last_name,
          username: username,
          pin: pin
        )
        user.persist!
      rescue StandardError => e
        Rails.logger.error("Could not register user: #{e}")
        return {error: e.message}
      end
      {success: true}
    end
  end
end
