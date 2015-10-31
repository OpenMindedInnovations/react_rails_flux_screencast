{ div, h1, ul, li, a, span, label, input } = React.DOM

TodoForm = React.createFactory React.createClass
  getInitialState: ->
    todoName: ''

  onInputChange: (e)->
    @setState(todoName: e.target.value)

  onInputKeyDown: (e)->
    if e.keyCode == 13 && this.refs.todo.value.length
      TodoActions.submitTodo(this.refs.todo.value)
      @setState(todoName: '')

  render: ->
    div className: 'form-group',
      label {}, 'Enter Todo'
      input
        onChange: @onInputChange,
        onKeyDown: @onInputKeyDown,
        ref: 'todo',
        className: 'form-control',
        placeholder: 'Enter todo name'
        value: @state.todoName

TodoListItem = React.createFactory React.createClass
  onCheckTodo: ->
    TodoActions.checkTodo(@props.todo.id)

  render: ->
    todoListClasses = 'list-item'
    todoListClasses += ' checked' if @props.todo.checked
    li className: todoListClasses, 
      a onClick: @onCheckTodo, className: 'btn btn-primary', 'Check'
      span className: 'list-text', @props.todo.name

TodoList = React.createFactory React.createClass
  render: ->
    ul className: 'list-unstyled',
      _.map @props.todos, (todo)=>
        TodoListItem(key: "todo-#{todo.id}", todo: todo)

window.TodoIndex = React.createClass
  getInitialState: ->
    todos: []

  componentWillMount: ->
    TodoStore.listen(@onChange)
    TodoActions.initData(@props)

  componentWillUnmount: ->
    TodoStore.unlisten(@onChange)

  onChange: (state)->
    @setState(state)

  render: ->
    div className: 'container',
      div className: 'row',
        div className: 'col-xs-12',
          h1 {}, 'Todo List'
          TodoForm()
          TodoList(todos: @state.todos)



