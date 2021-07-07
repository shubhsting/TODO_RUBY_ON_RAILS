class TodoItem < ApplicationRecord
  belongs_to :my_list
  
  def completed?
    !completed_at.blank?
  end
end
