class Task < ApplicationRecord

  def completed?
    !completed_at.nil?
  end

  def mark_as_completed
    update(completed_at: Date.new) #unless completed? # Create a new context for it
  end

  def mark_as_active
    update(completed_at: nil) #unless completed? # Create a new context for it
  end
end
