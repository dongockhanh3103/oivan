# frozen_string_literal: true

module Authn
  class Authentication

    class << self

      # This uses to check email and password of user is correct or not, user is existing or not.
      # Then create token to authenticated user to use services of system.
      #
      #
      # @param email    [String] User email
      # @param password [String] User password
      #
      # @return [String] Token to mark that user is authenticated
      def login(email, password)
        user = User.find_by_email(email)

        return { success: false } if user.nil?
        return { success: false } unless user.valid_password?(password)

        {
          success: true,
          info:    {
            email: user.email,
            name:  user.name,
            role:  user.role,
            token: AuthenTokenService.encode(email: user.email)
          }
        }
      end

    end

  end
end
