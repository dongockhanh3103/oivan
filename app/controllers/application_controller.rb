# frozen_string_literal: true

class ApplicationController < ActionController::Base

  rescue_from Authn::UnauthenticatedError, with: :redirect_to_home_page

  # To be used as before_action.
  # Will trigger auto-login attempts via the call to logged_in?
  # If all attempts to auto-login fail, the failure callback will be called.
  def require_authn!
    raise Authn::UnauthenticatedError if !logged_in?

    if current_user && User.roles[current_user.role] != User.roles[:teacher]
      logout

      raise Authn::UnauthenticatedError
    end
  end

  private

  # Check has current user logged
  def logged_in?
    !!current_user
  end

  def logout
    current_user = nil
    reset_session
  end

  def redirect_to_home_page
    redirect_to new_user_session_path
  end

end
