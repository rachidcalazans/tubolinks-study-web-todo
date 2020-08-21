import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["toggler"]

  toggle() {
    var el         = this.togglerTarget
    var taskId     = el.dataset.taskId
    var taskAction = el.dataset.taskAction

    var actions = {
      'create': {
        url: '/completed_tasks',
        options: {
          body: JSON.stringify({id: taskId}),
          method: 'post',
          headers: { Accept: 'application/json', 'Content-Type': 'application/json' },
        }
      },
      'destroy': {
        url: `/completed_tasks/${taskId}`,
        options: {
          method: 'delete',
        }
      },
    }

    var action = actions[taskAction]

    fetch(action.url, action.options)
      .then(function(response) {
        Turbolinks.clearCache()
        Turbolinks.visit(window.location)
    })
  }
}
