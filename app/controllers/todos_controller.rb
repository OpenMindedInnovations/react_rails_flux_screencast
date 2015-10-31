class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      render partial: 'todos/todo', locals: {todo: @todo} 
    else
      render json: @todo.errors.to_json
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    if @todo.update(checked: true)
      render partial: 'todos/todo', locals: {todo: @todo}
    else
      render json: @todo.errors.to_json
    end
  end

  private

    def todo_params
      params.require(:todo).permit(
        :name,
        :checked
      )
    end
end
