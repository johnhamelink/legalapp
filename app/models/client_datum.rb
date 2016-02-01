class ClientDatum < ActiveRecord::Base
  belongs_to :client
  validates_presence_of :key, :value, :client
end
