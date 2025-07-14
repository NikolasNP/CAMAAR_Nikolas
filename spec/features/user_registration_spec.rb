require "rails_helper"

RSpec.feature "User import", type: :feature do
  scenario "Importar novo usuário" do
    visit admin_usuarios_path
    attach_file("file", Rails.root.join("spec/fixtures/usuarios.json"))
    click_button "Importar dados"

    expect(page).to have_text("Usuários cadastrados com sucesso.")
    expect(User.count).to eq(1)
    expect(User.first.status).to eq("pending")
  end
end
