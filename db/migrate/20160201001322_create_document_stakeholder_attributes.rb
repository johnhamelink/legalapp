class CreateDocumentStakeholderAttributes < ActiveRecord::Migration
  def change
    create_table :document_stakeholder_attributes do |t|
      t.string :key
      t.string :value
      t.references :document_stakeholder, index: false, foreign_key: true

      t.timestamps null: false
    end

    add_index :document_stakeholder_attributes, :document_stakeholder_id, name: "doc_stake_attrs_doc_stkholder"
  end
end
