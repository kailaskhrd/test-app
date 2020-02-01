class CreateRights < ActiveRecord::Migration[6.0]
  def change
    create_table :rights do |t|
      t.string :name

      t.timestamps
    end
    add_index :rights, :name, unique: true
  end
end
