class Log < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :status
  validates :solution_description, presence: true
end
