get '/lists/:id/tasks/new' do
  @list = List.find_by(id: params[:id])
  erb :'/tasks/new'
end

post '/lists/:list_id/tasks' do
    @list = List.find_by(id: params[:list_id])
    task = @list.tasks.new(params[:task])
    if task.save
      redirect "/lists/#{@list.id}"
    else
      @errors = task.errors.full_messages
      erb :"/lists/#{@list.id}/task/new"
    end
  end

get '/lists/:list_id/tasks/:task_id/edit' do
  @list = List.find_by(id: params[:list_id])
  @task = Task.find_by(id: params[:task_id])
  erb :'/tasks/edit'
end

put '/lists/:list_id/tasks/:task_id' do
  task = Task.find_by(id: params[:task_id])
  task.update(params[:task])
  redirect "/lists/#{params[:list_id]}"
end

delete '/lists/:list_id/tasks/:task_id' do
  task = Task.find_by(id: params[:task_id])
  task.destroy()
  redirect "/lists/#{params[:list_id]}"
end
