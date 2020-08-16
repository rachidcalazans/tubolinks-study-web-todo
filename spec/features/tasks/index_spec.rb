require 'rails_helper'

describe 'Index', type: :feature, js: true do

  context 'show Task input form' do
    before do
      visit '/tasks'
    end

    it 'render input form' do
      expect(page).to have_content('Create your Task')
      expect(page).to have_selector '#task-input'
    end

    context 'when fill the input form' do
      context 'when submit' do
      it 'render the created Task' do
        find_by_id('task-input').set('Hello')
        click_on 'Save'

        sleep(2)
        expect(page).to have_text 'Hello'
      end
      end
    end
  end
end
