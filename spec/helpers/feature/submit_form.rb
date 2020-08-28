module Helpers
  module SubmitForm
    def submit_form(selector)
      page.execute_script "document.querySelector('#{selector}').submit()"
    end
  end
end
