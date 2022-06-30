require 'jwt'

module Authenticate
  class User
    SIGNING_ALGORITHM = "HS256"

    def self.auth_user(username:, pin:)
      user = ::User.find_by(username: username)
      return {error: "Username not found"} if user.nil?
      return {error: "Incorrect PIN"} unless user.matches_pin?(pin)
      {access_token: access_token(user)}
    end

    def self.access_token(user)
      payload = {sub: user.username, exp: Time.current.to_i + 10 * 3600}
      JWT.encode(payload, signing_key, SIGNING_ALGORITHM)
    end

    def self.signing_key
      @signing_key ||= Secret.instance.configuration['jwt_signing_key']
    end
  end
end
