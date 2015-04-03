class Ticket < ActiveRecord::Base
 belongs_to :team
 belongs_to :user
 belongs_to :status
 validates :customer_name, presence: true
 validates :customer_email, presence: true
end
