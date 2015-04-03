class Team < ActiveRecord::Base
  belongs_to :ticket
  validates :name, presence: true
  validates :short_name, presence: true
end