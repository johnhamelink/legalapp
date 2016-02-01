class DocumentTemplateAttribute < ActiveRecord::Base
  belongs_to :document_template
  validates_presence_of :document_template, :title, :key
end
