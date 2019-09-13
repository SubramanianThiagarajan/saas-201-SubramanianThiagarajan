require 'sinatra'
# Your app

def get_todos
  @@todos ||= []
end

def add_todo(todo)
  get_todos().push(todo)
end

def delete_todo
  get_todos().slice!(@id.to_i - 1)
end

def get_todo
  get_todos()[@id.to_i - 1]
end

def update_todo(title)
  get_todos()[@id.to_i - 1] = {title => get_todos()[@id.to_i - 1].values[0]}
end

#Display the main page
get "/todos" do
  @todos = get_todos()
  erb :todos
end

#Create the contents || items
post "/todos" do
	todo = {params[:title] => params[:date]}
  add_todo(todo)
  redirect "/todos"
end

#Display the content of the item
get "/todos/:id" do
  @id = params[:id]
  @todo = get_todo()
  erb :todo
end

#Update
put "/todos/:id" do
  @id = params[:id]
  update_todo(params[:title])
  redirect "/todos"
end

#Delete
delete "/todos/:id" do
  @id = params[:id]
  delete_todo()
  redirect "/todos"
end