class DocumentTemplate < ActiveRecord::Base
  validates_presence_of :name, :view_key
end
