# frozen_string_literal: true

module Admin
  class AdminController < ApplicationController

    before_action :require_authn! do
      current_user && current_user.role == User.roles[:teacher]
    end

    rescue_from Authn::UnauthenticatedError, with: :redirect_to_home_page

    private

    def redirect_to_home_page
      redirect_to new_user_session_path
    end

  end
end
