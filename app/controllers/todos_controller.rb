class TodosController < ApplicationController
	def index
		@todos = Todo.all
	end

  def show
    @todo = fetch_todo
  end

  def edit
    @todo = fetch_todo
  end

  def new
    @todo = Todo.new
  end

  def update
    @todo = fetch_todo
    @todo.update_attributes(todo_params)

    redirect_to todo_path(@todo)
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.save

    redirect_to todos_url
  end

  private
  def fetch_todo
    return Todo.find(params[:id])
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :due_date, :note)
  end
end
