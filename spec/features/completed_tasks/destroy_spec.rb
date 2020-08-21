require 'rails_helper'

describe 'Destroy a Completed Task', type: :feature, js: true do
  before do
    create_task

    visit '/tasks'

    unchecking_task
  end

  context 'when given a completed Task' do
    let(:create_task) { task_hello }
    let(:task_hello)  { Task.create(title: 'Hello', completed_at: Date.new) }

    context 'when unchecking the Task' do
      let(:unchecking_task) do
        find("input[checked][data-task-id=\"#{task_hello.id}\"].task-marker", visible: false).click
      end

      it 'render the active Task' do
        expect(page).not_to have_selector 'li.completed label', text: 'Hello'
        expect(page).to have_selector 'li label', text: 'Hello'
        expect(page).not_to have_selector "input[checked][data-task-id=\"#{task_hello.id}\"].task-marker", visible: false
        expect(page).to have_selector "input[data-task-id=\"#{task_hello.id}\"].task-marker", visible: false
      end
    end
  end
end
