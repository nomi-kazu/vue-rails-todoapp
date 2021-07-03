class V1::TodosController < ApplicationController
  before_action :set_todo, only: %i[destroy update]

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

  def update
    @todo.update(todo_params)
  end

  def destroy
    @todo.destroy
  end

  private
    def todo_params
      params.require(:todo).permit(:title)
    end

    def set_todo
      @todo = Todo.find(params[:id])
    end
end