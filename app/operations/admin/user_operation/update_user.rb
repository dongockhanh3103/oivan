# frozen_string_literal: true

module Admin
  module UserOperation
    class UpdateUser < BaseOperation

      # Init user params
      def initialize(param)
        @param = param
      end

      # Create a User
      #
      # @return [Hash] The result after handle updated User
      def execute
        user = User.find_by(id: @param[:id])
        if user.present?
          user.update!(
            password:              @param[:password],
            password_confirmation: @param[:password_confirmation],
            email:                 @param[:email],
            role:                  @param[:role].to_sym,
            name:                  @param[:name]
          )

          { success: true }
        else
          { success: false }
        end
      end

    end
  end
end
