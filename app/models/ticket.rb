class Ticket < ActiveRecord::Base
 belongs_to :team
 belongs_to :user
 belongs_to :status
 has_many :logs
 validates :customer_name, presence: true
 validates :customer_email, presence: true
 validates :ticket_name, presence: true
end

