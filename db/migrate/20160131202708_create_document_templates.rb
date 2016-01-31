class CreateDocumentTemplates < ActiveRecord::Migration
  def change
    create_table :document_templates do |t|
      t.string :name
      t.string :view_key
      t.timestamps null: false
    end
  end
end
