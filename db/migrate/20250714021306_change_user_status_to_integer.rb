class ChangeUserStatusToInteger < ActiveRecord::Migration[7.0]
  def up
    change_column :users, :status, :integer, using: "CASE status WHEN 'pending' THEN 0 WHEN 'active' THEN 1 END", default: 0
  end

  def down
    change_column :users, :status, :string
  end
end
