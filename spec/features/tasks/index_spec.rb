require 'rails_helper'

describe 'Index', type: :feature, js: true do

  context 'show Task input form' do
    before do
      visit '/tasks'
    end

    it 'renders clear state of index page' do
      expect(page).to have_selector 'form input#task-input'
      expect(page).to have_selector 'ul.todo-list'
    end
  end
end
