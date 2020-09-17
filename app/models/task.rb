class Task < ApplicationRecord

  scope :active,   ->() { where(completed_at: nil) }
  scope :completed, ->() { where.not(completed_at: nil) }
  scope :filter_by, ->(task_filter) {
    return completed if task_filter == 'completed'
    return active   if task_filter == 'active'

    all
  }

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
