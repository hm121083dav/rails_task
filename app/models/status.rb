class Status < ActiveRecord::Base
  has_many :tickets
  has_many :logs
  validates :name, presence: true
end
