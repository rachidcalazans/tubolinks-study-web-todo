require 'rails_helper'

describe 'Update', type: :feature, js: true do
  include ActionView::RecordIdentifier

  context 'show existing Tasks' do
    before do
      task
      visit '/tasks'
    end

    let(:task) { Task.create(title: 'Old task title') }
    let(:form_selector) { "li form##{dom_id(task, :edit)}" }
    let(:input_form_selector) { "#{form_selector} input" }

    it 'does not show the edit input form' do
      expect(page).not_to have_selector input_form_selector
    end

    context 'when double clicking on a Task' do
      before do
        double_click_on_task
      end

      it 'shows the edit text input' do
        expect(page).to have_selector "#{input_form_selector}:focus"
      end

      context 'when changing the task title' do
        before do
          find(input_form_selector).set(new_task_title)
        end

        let (:new_task_title) { 'New task title' }

        context 'when submitting the form' do
          before do
            submit_form(form_selector)
          end

          it 'renders the updated task with new title' do
            expect(page).to have_selector 'li label', text: new_task_title
          end
        end

        context 'when pressing ESC after changing the task' do
          before do
            find(input_form_selector).send_keys :escape
          end

          it 'reverts the changes' do
            expect(page).not_to have_selector input_form_selector
            expect(page).to have_selector 'li label', text: task.title
          end

          context 'when trying to edit again' do
            before do
              double_click_on_task
            end

            it 'shows the original title on the input' do
              expect(find(input_form_selector).value).to eql(task.title)
            end
          end
        end
      end
    end
  end

  private

    def double_click_on_task
      find_by_id(dom_id(task)).double_click
    end
end
