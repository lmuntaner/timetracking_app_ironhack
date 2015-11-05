class Entry < ActiveRecord::Base
  validates :project, presence: true
  validates :hours, :minutes, :date, presence: true
  # validates :project_id, presence: true

  belongs_to :project

  # def project
  #   returns the project of this entry
  # end

  def total_minutes
    hours * 60 + minutes
  end
end
