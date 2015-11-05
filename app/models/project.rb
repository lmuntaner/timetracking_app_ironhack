class Project < ActiveRecord::Base
  validates :title, uniqueness: true, presence: true, length: { maximum: 30 }
  validates :priority, presence: true, inclusion: { in: [1,2,3,4,5] }

  has_many :entries, dependent: :destroy

  def self.iron_high_priority
    puts self
    self.where("title like 'Ironhack%' AND priority = 3")
  end

  # Add a method 'low_priority' that gets all the projects with
  # priority less than 3
  def self.low_priority
    puts self
    where("priority < 3")
  end

  # def entries
  #   returns an array-like of the entries of this project
  # end

  def total_time
    entries.reduce(0) do |acc, entry|
      acc + entry.total_minutes
    end
  end
end
