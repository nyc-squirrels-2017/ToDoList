get '/lists/:id/tasks/new' do
  @list = List.find_by(id: params[:id])
  erb :'/tasks/new'
end


get '/lists/:id/tasks/:id' do
  @list = List.find_by(id: params[:id])
  @tasks = @list.tasks
  erb :'/tasks/index'
end


get '/tasks/:id' do
  @task = Task.new.find(params[:id])
  erb :"/tasks/show"
end


post '/list/:id/tasks' do
  @task = Task.new(params[:task])
  @task.list_id = params[:id]
    if @task.save
      redirect "/lists/#{@task.list_id}"
    else
      erb :'/tasks/new'
    end
end
