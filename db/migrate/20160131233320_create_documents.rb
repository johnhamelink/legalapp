class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :name
      t.references :client, index: true, foreign_key: true
      t.references :document_template, index: true, foreign_key: true
      t.string :document_state
      t.text :document_content

      t.timestamps null: false
    end
  end
end
