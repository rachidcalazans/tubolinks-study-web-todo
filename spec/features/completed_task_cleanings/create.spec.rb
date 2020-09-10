require 'rails_helper'

describe 'Clean completed tasks' do
  let(:clear_completed_tasks_button_selector) { '.footer .clear-completed' }

  context 'Completed tasks button' do
    before do
      completed_task

      visit '/tasks'
    end

    context 'when there are no completed tasks' do
      let(:completed_task) {}

      it 'does not show the button' do
        expect(page).not_to have_selector(clear_completed_tasks_button_selector)
      end
    end

    context 'when there are completed tasks' do
      let(:completed_task) { Task.create(title: 'A completed task', completed_at: Date.new) }

      it 'shows the button' do
        expect(page).to have_selector(clear_completed_tasks_button_selector)
      end

      it 'clears all completed tasks' do
        find(clear_completed_tasks_button_selector).click

        expect(page).not_to have_content(completed_task.title)
        expect(page).not_to have_selector(clear_completed_tasks_button_selector)
      end
    end
  end
end
