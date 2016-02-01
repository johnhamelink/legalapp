class CreateDocumentTemplateAttributes < ActiveRecord::Migration
  def change
    create_table :document_template_attributes do |t|
      t.references :document_template, index: true, foreign_key: true
      t.string :title
      t.string :key

      t.timestamps null: false
    end
  end
end
