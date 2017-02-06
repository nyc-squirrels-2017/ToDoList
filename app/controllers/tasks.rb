get '/lists/:list_id/tasks/new' do
  @list = current_user.lists.find_by(id: params[:list_id])
  @task = Task.new
  erb :'/tasks/new'
end

post '/lists/:list_id/tasks' do
  @list = current_user.lists.find_by(id: params[:list_id])
  @task = @list.tasks.new(params[:task])
  if @task.save
    redirect "/lists/#{@list.id}"
  else
    @errors = @task.errors.full_messages
    erb :'/tasks/new'
  end
end

get '/lists/:list_id/tasks/:id/edit' do
  @list = current_user.lists.find_by(id: params[:list_id])
  @task = Task.find_by(id: params[:id])
  erb :'/tasks/edit'
end


put '/lists/:list_id/tasks/:id' do
  # params.inspect
  @list = current_user.lists.find_by(id: params[:list_id])
  @task = Task.find_by(id: params[:id])
  if @task.update(params[:task])
    redirect "/lists/#{@list.id}"
  else
    @errors = @list.errors.full_messages
    erb :'/tasks/edit'
  end
end

delete '/lists/:list_id/tasks/:id' do
  @list = current_user.lists.find_by(id: params[:list_id])
  @task = Task.find_by(id:params[:id])
  @task.destroy
  redirect "/lists/#{@list.id}"
end
