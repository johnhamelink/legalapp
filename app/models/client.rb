class Client < ActiveRecord::Base
  has_many :client_data
  validates_presence_of :name
end
