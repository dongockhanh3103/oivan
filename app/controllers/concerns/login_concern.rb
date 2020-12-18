# frozen_string_literal: true

module LoginConcern

  extend ActiveSupport::Concern

  # @param email [String]
  # @param password [String]
  def login(email, password)
    response = Authn::Authentication.login(email, password)

    if response[:success]
      render_success_response(data: response)
    else
      render_failed_response
    end
  end

  # Revoke all refresh token and reset session
  def logout
    RefreshTokenOperation::RevokeRefreshToken.execute(current_user.id)
    current_user = nil
    reset_session
  end

end
