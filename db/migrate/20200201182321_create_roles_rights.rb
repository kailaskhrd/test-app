class CreateRolesRights < ActiveRecord::Migration[6.0]
  def change
    create_table :roles_rights do |t|
      t.references :role, null: false, foreign_key: true
      t.references :right, null: false, foreign_key: true
      t.integer  :status,         limit: 4
      t.timestamps
    end
  end
end
