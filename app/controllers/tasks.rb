get '/lists/:id/tasks' do
  @list = current_user.lists.find_by(id: params[:id])
  erb :'/tasks/index'
end

get '/lists/:id/tasks/new' do
  @list = current_user.lists.find_by(id: params[:id])
  @task = Task.new
  erb :'/tasks/new'
end

post '/lists/:id/tasks' do
  @list = current_user.lists.find_by(id: params[:id])
  @task = @list.tasks.new(params[:task])
  if @task.save
    redirect "/lists/#{@list.id}/tasks"
  else
    @errors = @task.errors.full_messages
    erb :'/tasks/new'
  end
end

get '/lists/:list_id/tasks/:id' do
  @list = current_user.lists.find_by(id: params[:list_id])
  @task = Task.find_by(id: params[:id])
  erb :'/tasks/show'
end

get '/lists/:list_id/tasks/:id/edit' do
  @list = current_user.lists.find_by(id: params[:list_id])
  @task = Task.find_by(id: params[:id])
  erb :'/tasks/edit'
end

get '/lists/:list_id/tasks/:id/complete' do
  @list = current_user.lists.find_by(id: params[:list_id])
  @task = Task.find_by(id: params[:id])

end

put '/lists/:list_id/tasks/:id' do
  @list = current_user.lists.find_by(id: params[:list_id])
  @task = Task.find_by(id: params[:id])
  if @task.update(params[:task])
    redirect "/lists/#{@list.id}/tasks/#{@task.id}"
  else
    @errors = @list.errors.full_messages
    erb :'/tasks/edit'
  end
end

delete '/tasks/:id' do
  @task.destroy
  redirect '/lists'
end
