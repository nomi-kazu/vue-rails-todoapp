class V1::TodosController < ApplicationController

  def index
    todos = Todo.order(:id)
    render json: todos
  end

  def create 
    todo = Todo.new(todo_params)
    if todo.save
      render json: todo, status: :created
    else
      render json: todo.errors, status: :unprocessable_entity
    end
  end

  private
    def todo_params
      params.require(:todo).permit(:title)
    end

end