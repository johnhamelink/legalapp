class DocumentStakeholder < ActiveRecord::Base
  belongs_to :document
  has_many :document_stakeholder_attributes

  def get_attr(key)
    if attr = self.document_stakeholder_attributes.find_by_key(key)
      return attr.value
    else
      return "<b>Error: Cannot find property '#{key}' in '#{self.stakeholder_type}'</b>".html_safe 
    end
  end

  def self.method_missing?(method_sym, *arguments, &block)
    if attr = self.document_stakeholder_attributes.find_by_key(:method_sym)
      return attr
    else
      super
    end
  end
end
