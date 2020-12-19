# frozen_string_literal: true

module Admin
  module UserOperation
    class CreateUser < BaseOperation

      # Init user params
      def initialize(param)
        @param = param
      end

      # Create a User
      #
      # @return [Hash] The result after handle created User
      def execute
        user = User.create(
                password:              @param[:password],
                password_confirmation: @param[:password_confirmation],
                email:                 @param[:email],
                role:                  @param[:role].to_sym,
                name:                  @param[:name]
              )

        if user.persisted?
          { success: true }
        else
          { success: false }
        end
      end

    end
  end
end
