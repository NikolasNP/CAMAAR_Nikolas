class CreateTestModels < ActiveRecord::Migration[8.0]
  def change
    create_table :test_models do |t|
      t.string :name
      t.integer :status

      t.timestamps
    end
  end
end
