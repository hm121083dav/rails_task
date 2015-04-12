class Ticket < ActiveRecord::Base
 belongs_to :team
 belongs_to :user
 belongs_to :status
 has_many :logs
 validates :ticket_name, presence: true
 validates :customer_name, presence: true
 validates :customer_email, presence: true
 validates :subject, presence: true
 validates :team_id, presence: true
 validates :description, presence: true
end

