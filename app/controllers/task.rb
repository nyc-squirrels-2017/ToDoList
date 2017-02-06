before '/lists/:l_id/tasks*' do
  @list = List.find_by_id(params[:l_id])
end

# index
get '/lists/:l_id/tasks' do
  redirect "/lists/#{params[:l_id]}"
end

# new
get '/lists/:l_id/tasks/new' do
  erb :"/tasks/new"
end

post '/lists/:l_id/tasks' do
  @list = List.find_by_id(params[:l_id])

  @task = @list.tasks.new(params[:task])
  @task.save
  if @task.save
    redirect "/lists/#{@list.id}"
  else
    @errors = @task.errors.full_messages
    erb :"/tasks/new"
  end
end

# update
get '/lists/:l_id/tasks/:id/edit' do
  @task = Task.find_by_id(params[:id])
  erb :"/tasks/edit"
end

put '/lists/:l_id/tasks/:id' do
  @task = Task.find_by_id(params[:id])

  if @task.update(params[:task])
    redirect "/lists/#{@list.id}"
  else
    @errors = @task.errors.full_messages
    erb :"/tasks/edit"
  end
end

# delete
delete '/lists/:l_id/tasks/:id' do

end
