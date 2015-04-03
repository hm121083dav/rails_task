class Status < ActiveRecord::Base
  belongs_to :ticket
  validates :name, presence: true
end
