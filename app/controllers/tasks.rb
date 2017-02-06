get '/lists/:id/tasks' do
  @list_id = params[:id]
  redirect "/lists/#{@list_id}"
end


get '/lists/:id/tasks/new' do
  @task = Task.new
  @list = List.find_by(id: params[:id])
  erb :'tasks/new'
end

post '/lists/:id/tasks' do
    @list = List.find(params[:id])
    @task = @list.tasks.create(task: params[:task])
  if request.xhr?
    erb :"partial/_new_task", layout: false
  else
    redirect "/lists/#{@list.id}"
  end
end

put'/tasks/:id' do
  @task = Task.find(params[:id])
  @task.update_attributes(completed: true)
  redirect "lists/#{@task.list_id}"
end

