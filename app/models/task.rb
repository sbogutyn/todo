class Task < ActiveRecord::Base 
  validates :name, :presence => true, :uniqueness => true, :length => {:minimum => 5}
  validates :progress, :presence => true, :numericality => true
  validates :priority, :presence => true, :numericality => true
  validates :description, :length => {:minimum => 5}
  has_many :comments
  belongs_to :user
end
