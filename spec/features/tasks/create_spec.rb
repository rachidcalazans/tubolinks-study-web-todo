require 'rails_helper'

describe 'Create', type: :feature, js: true do

  context 'show Task input form' do
    before do
      visit '/tasks'
    end

    context 'when fill the input form' do
      context 'when submit' do
        it 'render the created Task' do
          find_by_id('task-input').set('Hello')

          # todo: is there a better way?
          page.execute_script 'document.getElementsByTagName(\'form\')[0].submit()'

          expect(page).to have_selector 'li label', text: 'Hello'
          expect(page).to have_selector 'li a.destroy[data-task-id]', visible: false
          expect(page).to have_selector 'li a.destroy', visible: false
          expect(page).to have_selector 'li input.toggle', visible: false
        end
      end
    end
  end
end
