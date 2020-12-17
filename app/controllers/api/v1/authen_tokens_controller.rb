# frozen_string_literal: true

module Api
  module V1
    class AuthenTokensController < Api::V1::ApplicationController

      include LoginConcern

      skip_before_action :authentication_user!, only: [:create]

      # POST /api/v1/authen_tokens/
      # Verify email and password
      # Return { Hash }
      def create
        login(login_params[:email], login_params[:password])
      end

      private

      def login_params
        if params[:email].nil? || params[:password].nil?
          raise Params::InvalidParamError.new(params, 'Email or password is invalid')
        end

        params.permit(:email, :password)
      end

    end
  end
end
