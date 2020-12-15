# frozen_string_literal: true

module Authn

  module Controller

    def self.included(klass)
      klass.class_eval do
        include InstanceMethods
      end
    end

  end

  module InstanceMethods

    # To be used as before_action.
    # Will trigger auto-login attempts via the call to logged_in?
    # If all attempts to auto-login fail, the failure callback will be called.
    def require_authn!
      if block_given?
        yield
      elsif !logged_in?
        authn_failed!
      end
    end

    protected

    def authn_failed!(messages = [])
      raise Authn::UnauthenticatedError, messages
    end

    def logged_in?
      !!current_user
    end

  end

end
