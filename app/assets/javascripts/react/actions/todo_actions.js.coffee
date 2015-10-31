class TodoActions
  constructor: ->
    @generateActions(
      'initData',
      'submitTodo',
      'checkTodo'
    )

window.TodoActions = alt.createActions(TodoActions)
