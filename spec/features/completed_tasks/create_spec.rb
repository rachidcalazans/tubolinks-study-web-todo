require 'rails_helper'

describe 'Create a Completed Task', type: :feature, js: true do
  before do
    create_task

    visit '/tasks'

    checking_task
  end

  context 'when given an active Task' do
    let(:create_task) { task_hello }
    let(:task_hello)  { Task.create(title: 'Hello') }

    context 'when checking the Task' do
      let(:checking_task) do
        find("input[data-task-id=\"#{task_hello.id}\"].task-marker", visible: false).click
      end

      it 'render the completed Task' do
        expect(page).to have_selector 'li.completed label', text: 'Hello'
        expect(page).to have_selector "input[checked][data-task-id=\"#{task_hello.id}\"].task-marker", visible: false
      end
    end
  end
end

