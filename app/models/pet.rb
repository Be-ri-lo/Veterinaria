class Pet < ApplicationRecord
belongs_to :client
has_many :histories
accepts_nested_attributes_for :histories
    
  def to_s
    name
  end

  def histories_count 
    self.histories.count
  end
    
  def average_weight 
    self.histories.sum(:weight) / self.histories_count 
  end
    
  def average_height 
    self.histories.sum(:height) / self.histories_count
  end
    
  def max_weight
    self.histories.maximum(:weight)
  end
    
  def max_height
    self.histories.maximum(:height)
  end
    
end
