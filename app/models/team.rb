class Team < ActiveRecord::Base
  has_many :tickets
  validates :name, presence: true
  validates :short_name, presence: true
end
