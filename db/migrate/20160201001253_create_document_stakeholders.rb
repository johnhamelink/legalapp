class CreateDocumentStakeholders < ActiveRecord::Migration
  def change
    create_table :document_stakeholders do |t|
      t.references :document, index: true, foreign_key: true
      t.string :stakeholder_type
      t.timestamps null: false
    end
  end
end
