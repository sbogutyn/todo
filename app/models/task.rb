class Task < ActiveRecord::Base 
  validates :name, :presence => true, :uniqueness => true, :length => {:minimum => 5}
  validates :progress, :presence => true, :numericality => true
  validates :priority, :presence => true, :numericality => true
  validates :description, :length => {:minimum => 5}
  has_many :comments
  belongs_to :user  

  def ile_do_konca
    unless deadline.nil?
      @ile_do_konca = deadline - DateTime.now
      if @ile_do_konca.to_i >= 0
        @ile_do_konca.to_i.to_s + " dni"
      else
        "koniec czasu"
      end
    else
      false
    end
  end

end
