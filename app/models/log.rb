class Log < ActiveRecord::Base
  belongs_to :ticket
  belongs_to :status
  #validates :solution_description, presence: true

  def assigned_user
    User.find_by_id(assigned_id).full_name
  end

  def committer
    User.find_by_id(committer_id).full_name
  end
end
