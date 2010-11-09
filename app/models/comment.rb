class Comment < ActiveRecord::Base
  validates :description, :presence => true, :length => { :minimum => 3 }
  validates :task_id, :presence => true, :numericality => true
  belongs_to :task
end
