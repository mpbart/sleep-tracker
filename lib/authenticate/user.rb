require 'jwt'
require 'entity/user'

module Authenticate
  class User
    SIGNING_ALGORITHM = "HS256"

    def self.login_user(username:, pin:)
      begin
        user = Entity::User.find_by(username: username)
        return {error: "Incorrect PIN"} unless user.matches_pin?(pin)
        {access_token: access_token(user)}
      rescue Entity::Base::RecordNotFoundError
        {error: "Username not found"}
      end
    end

    def self.authenticate_from_token(token)
      begin
        decoded_token = JWT.decode(token, signing_key, true)
        user = ::Entity::User.find_by(username: decoded_token.first['sub'])
        {current_user: user.build}
      rescue JWT::ExpiredSignature
        {error: "Expired Token"}
      rescue => e
        {error: "Unexpected Error: #{e.inspect}"}
      end
    end

    def self.access_token(user)
      # Set token expiration to 10 minutes from now
      payload = {sub: user[:username], exp: Time.current.to_i + 10 * 3600}
      JWT.encode(payload, signing_key, SIGNING_ALGORITHM)
    end

    def self.signing_key
      @signing_key ||= Secret.instance.configuration['jwt_signing_key']
    end
  end
end
