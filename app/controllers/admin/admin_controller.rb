# frozen_string_literal: true

module Admin
  class AdminController < ApplicationController

    before_action :require_authn!

    rescue_from ActiveRecord::RecordNotFound, with: :render_404
    rescue_from ActionController::RoutingError, with: :render_404

    private

    def render_404(exception = nil)
      logger.info "Rendering 404: #{exception.message}" if exception

      render file: "#{Rails.root}/public/404.html", status: 404, layout: false
    end

  end
end
