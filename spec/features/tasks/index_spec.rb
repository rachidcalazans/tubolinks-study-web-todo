require 'rails_helper'

describe 'Index', type: :feature, js: true do
  include ActionView::RecordIdentifier

  context 'show Task input form' do
    before do
      visit '/tasks'
    end

    it 'renders clear state of index page' do
      expect(page).to have_selector 'form input#task-input'
      expect(page).to have_selector 'ul.todo-list'
    end
  end

  describe 'navigating tabs' do
    context 'when have completed and active tasks' do
      before do
        active_task
        completed_task

        visit '/tasks'
      end

      let(:active_task)    { Task.create(title: 'Task active') }
      let(:completed_task) { Task.create(title: 'Task completed', completed_at: Date.new) }

      context 'when click on :all tab' do
        before do
          find('ul.filters a#all').click
        end

        it 'render all tasks completed and active' do
          expect(page).to have_selector "li label##{dom_id(active_task)}", text: active_task.title
          expect(page).to have_selector "li label##{dom_id(completed_task)}", text: completed_task.title
          expect(page).to have_selector "ul.filters a#all.selected"
        end
      end

      context 'when click on :active tab' do
        before do
          find('ul.filters a#active').click
        end

        it 'render all tasks active' do
          expect(page).to have_selector "li label##{dom_id(active_task)}", text: active_task.title
          expect(page).not_to have_selector "li label##{dom_id(completed_task)}", text: completed_task.title
          expect(page).to have_selector "ul.filters a#active.selected"
        end
      end

      context 'when click on :completed tab' do
        before do
          find('ul.filters a#completed').click
        end

        it 'render all tasks completed' do
          expect(page).not_to have_selector "li label##{dom_id(active_task)}", text: active_task.title
          expect(page).to have_selector "li label##{dom_id(completed_task)}", text: completed_task.title
          expect(page).to have_selector "ul.filters a#completed.selected"
        end
      end
    end
  end
end
