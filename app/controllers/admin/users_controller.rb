# frozen_string_literal: true

module Admin
  class UsersController < Admin::AdminController

    before_action :set_user, only: %i[edit destroy show]

    # GET /admin/users
    def index
      @users = User.all_except(current_user)
    end

    # GET /admin/users/:id
    def show; end

    # GET /admin/users/1/edit
    def edit
      @roles ||= User.roles.keys
    end

    # PATCH/PUT /admin/users/1
    def update
      result = Admin::UserOperation::UpdateUser.execute(build_update_params)

      respond_to do |format|
        if result[:success]
          format.html { redirect_to admin_users_path, notice: 'User was successfully updated.' }
        else
          format.html { render :edit }
        end
      end
    end

    # DELETE /admin/users/1
    def destroy
      @user.destroy
      respond_to do |format|
        format.html { redirect_to admin_users_path, notice: 'User was successfully destroyed.' }
      end
    end

    private

    def set_user
      @user ||= User.find(params[:id])
    end

    def build_update_params
      params.require(:user).permit(:password, :password_confirmation, :name, :id, :email, :role)
    end

  end
end
