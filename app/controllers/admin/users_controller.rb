# frozen_string_literal: true

module Admin
  class UsersController < Admin::AdminController

    # GET /admin/users
    def index
      @users = User.all_except(current_user)
    end

  end
end
