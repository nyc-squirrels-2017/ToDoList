get '/lists/:list_id/tasks' do
  redirect "/lists/#{params[:list_id]}"
end

get '/lists/:list_id/tasks/new' do
  @list = List.find_by(id: params[:list_id])
  authorized_user
  if request.xhr?
    erb :'/tasks/new', layout: false
  else
    erb :'/tasks/new'
  end
end

post '/lists/:list_id/tasks' do
  @list = List.find_by(id: params[:list_id])
  task = @list.tasks.new(params[:task])
  if request.xhr?
    if task.save
      erb :'/partials/_single_task', layout: false, locals:{task:task}
    else
      status 422
      @errors = task.errors.full_messages
      erb :'/partials/_errors', layout: false
    end
  else
    if task.save
      redirect "/lists/#{@list.id}"
    else
      @errors = task.errors.full_messages
      erb :"/lists/#{@list.id}/task/new"
    end
  end
end

get '/lists/:list_id/tasks/:task_id/edit' do
  @list = List.find_by(id: params[:list_id])
  @task = Task.find_by(id: params[:task_id])
  authorized_user
  if request.xhr?
    erb :'/tasks/edit', layout: false
  else
    erb :'/tasks/edit'
  end
end

put '/lists/:list_id/tasks/:task_id' do
  @list = List.find_by(id: params[:list_id])
  task = Task.find_by(id: params[:task_id])
  task.update(params[:task])
  if request.xhr?
    # "hello"
    erb :'/partials/_single_task', layout: false, locals:{task:task}
  else
    redirect "/lists/#{params[:list_id]}"
  end
end

delete '/lists/:list_id/tasks/:task_id' do
  task = Task.find_by(id: params[:task_id])
  task.destroy()
  redirect "/lists/#{params[:list_id]}" unless request.xhr?
end
