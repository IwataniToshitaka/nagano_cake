# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]

 def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :encrypted_password])
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
    customer_my_page_path
  end
    #既に登録済みのユーザがログインした後の遷移先指定

  def after_sign_out_path_for(resource)
    customer_session_path
    #遷移先のパス
  end#ユーザがサインアウトした後の遷移先指定

end
