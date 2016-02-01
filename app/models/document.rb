class Document < ActiveRecord::Base
  STATES = %w(archived draft completed published)
  belongs_to :client
  belongs_to :document_template
  has_many :document_stakeholders
  validates_presence_of :name, :client, :document_template, :document_state, :document_content
  validates_inclusion_of :document_state, in: STATES
end
