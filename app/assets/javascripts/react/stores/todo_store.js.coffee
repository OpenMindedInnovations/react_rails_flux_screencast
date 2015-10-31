class TodoStore
  @displayName: 'TodoStore'

  constructor: ->
    @bindActions(TodoActions)
    @todos = []

    @exportPublicMethods(
      { 
        getTodos: @getTodos
      }
    )

  onInitData: (props)->
    @todos = props.todos

  onSubmitTodo: (name)->
    $.ajax
      type: 'POST'
      url: '/todos'
      data:
        todo:
          name: name
          checked: false
      success: (response)=>
        @todos.push(response)
        @emitChange()
      error: (response)=>
        console.log('error')
        console.log(response)

    return false

  onCheckTodo: (todo_id)->
    $.ajax
      type: 'DELETE'
      url: "/todos/#{todo_id}"
      success: (response)=>
        _.find(@todos, { id: response.id} ).checked = true
        @emitChange()
      error: (response)=>
        console.log('error')
        console.log(response)

    return false

  getTodos: ()->
    @getState().todos

window.TodoStore = alt.createStore(TodoStore)
