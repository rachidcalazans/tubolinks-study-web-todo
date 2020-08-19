require 'rails_helper'

describe 'Destroy', type: :feature, js: true do
  before do
    @task = Task.create(title: 'Something')

    visit '/tasks'
  end

  context 'clicks on detroy button of a task' do
    before do
      # find("a[data-task-id]", visible: false).click
      # find("a.destroy", visible: false).click
      # click_on "", visible: false
      # todo: is there a better way?
      page.execute_script "document.querySelector('a[data-task-id=\"#{@task.id}\"]').click()"
    end

    it 'removes the item' do
      expect(page).not_to have_selector 'li label', text: @task.title
    end
  end
end
