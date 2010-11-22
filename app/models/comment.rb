class Comment < ActiveRecord::Base
  validates :description, :presence => true, :length => { :minimum => 3 }
  validates :task_id, :presence => true, :numericality => true
  belongs_to :task  

  def markdown
    RDiscount.new(description).to_html
  end
end
