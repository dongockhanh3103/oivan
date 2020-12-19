# frozen_string_literal: true

module Api
  module V1
    class AuthenTokensController < Api::V1::ApplicationController

      include LoginConcern

      skip_before_action :authentication_user!, only: %i[create refresh_token]

      # POST /api/v1/authen_tokens/
      #
      # Verify email and password
      # Return [Hash]
      def create
        login(login_params[:email], login_params[:password])
      end

      # Request new authen token by using refesh token.
      # This API require authorization token from login api.
      #
      # @return
      # If refresh token successfully, return:
      #
      #  {
      #    status: 'success',
      #    refresh_token: <refresh token>,
      #    token: <token>
      #  }
      #
      # If refresh token failed, return:
      #
      #  {
      #    status: 'failed',
      #    errors: [ <error message> ]
      #  }
      def refresh_token
        refresh_token_decode = AuthenTokenService.decode(refresh_token_params[:refresh_token])

        if refresh_token_decode[:token].blank? || refresh_token_decode[:user_id].blank?
          raise Params::InvalidParamError.new(refresh_token_params, 'Refresh token is invalid')
        end

        response = Authn::Authentication.refresh_token(refresh_token_decode)

        if response[:success]
          render_success_response(
            refresh_token: response[:refresh_token],
            token:         response[:token]
          )
        else
          render_failed_response
        end
      end

      # DELETE /api/v1/authen_tokens/
      #
      # Return [Boolean] Logout or not
      def destroy
        response = logout

        if response[:success]
          render_success_response
        else
          render_failed_response
        end
      end

      private

      def login_params
        if params[:email].nil? || params[:password].nil?
          raise Params::InvalidParamError.new(params, 'Email or password is invalid')
        end

        params.permit(:email, :password)
      end

      def refresh_token_params
        if params.permit(:refresh_token).blank?
          raise Params::InvalidParamError.new(params, 'Provide invalid parameters')
        end

        params.permit(:refresh_token)
      end

    end
  end
end
