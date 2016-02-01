class CreateClientData < ActiveRecord::Migration
  def change
    create_table :client_data do |t|
      t.references :client, index: true, foreign_key: true
      t.string :key, index: true
      t.text :value

      t.timestamps null: false
    end
  end
end
