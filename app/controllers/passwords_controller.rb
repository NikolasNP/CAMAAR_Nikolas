# app/controllers/passwords_controller.rb
class PasswordsController < ApplicationController
  def edit
    @user = User.find_signed!(params[:token], purpose: "password_reset")
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to root_path, alert: "Link inválido ou expirado."
  end

  def update
    @user = User.find_signed!(params[:token], purpose: "password_reset")
    if @user.update(password_params.merge(status: "active"))
      redirect_to root_path, notice: "Conta ativada com sucesso"
    else
      render :edit
    end
  end

  private

  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end
end
