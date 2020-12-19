# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ActionController::API

      include Authn::Controller

      before_action :authentication_user!
      rescue_from Params::InvalidParamError, with: :render_invalid_param_error
      rescue_from Authn::UnauthenticatedError, with: :render_unauthenticated_errors
      rescue_from ActionController::RoutingError, with: :render_404

      # Show 404 page when the url is invalid
      #
      # RubyCritic:UncommunicativeMethodName: 404 is widely used as a HTTP error code
      def render_404
        render json: {
          message: '404 Not Found',
          details: exception.error_codes
        }, status: 404
      end

      # Render 422 error with the details
      #
      # @param [Params::InvalidParamError] invalid_param_error
      def render_invalid_param_error(invalid_param_error)
        render json: {
          message: 'Provided params do not valid.',
          details: invalid_param_error.error_details
        }, status: 422
      end

      # Render success response
      def render_success_response(options = { })
        render json: {
          status: 'success'
        }.merge!(options)
      end

      # Render failed response
      def render_failed_response(options = { })
        render json: {
          status: 'failed'
        }.merge!(options)
      end

      # Render 403 error with the details
      def render_unauthorized_errors(exception)
        render json: {
          message: 'Unauthorized.',
          details: exception.error_codes
        }, status: 403
      end

      # Render unauthenticated error with the details
      def render_unauthenticated_errors(exception)
        render json: {
          message: 'UnAuthenticated.',
          details: exception.error_codes
        }, status: 401
      end

    end
  end
end
