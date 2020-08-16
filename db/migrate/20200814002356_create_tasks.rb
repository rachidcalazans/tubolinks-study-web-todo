class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string    :title
      t.timestamp :completed_at

      t.timestamps
    end
  end
end
