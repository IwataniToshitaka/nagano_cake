# frozen_string_literal: true

class Admin::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  def top

  end


  # GET /resource/sign_in
  # def new
  #   super
  # end
  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    admin_top_path
    #管理者ログイン後の遷移先指定
  end

  def after_sign_out_path_for(resource)
    new_admin_session_path
    #遷移先のパス
  end#ユーザがサインアウトした後の遷移先指定

end
