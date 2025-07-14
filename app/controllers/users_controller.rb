class UsersController < ApplicationController
    def import
        file = params[:file]
        users_data = JSON.parse(file.read)

        novos_usuarios = 0

        users_data.each do |user_data|
            next if User.exists?(registration: user_data["registration"])

            user = User.create!(
            name: user_data["name"],
            email: user_data["email"],
            registration: user_data["registration"],
            status: "pending",
            password: SecureRandom.hex(8) # senha temporária
            )

            UserMailer.password_reset(user).deliver_later
            novos_usuarios += 1
        end

        if novos_usuarios > 0
            redirect_to admin_usuarios_path, notice: "Usuários cadastrados com sucesso."
        else
            redirect_to admin_usuarios_path, notice: "Sem novos usuários."
        end
    end
end
