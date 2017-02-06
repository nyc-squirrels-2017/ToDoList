before do
  require_user
  @list = current_user.lists.find_by(id: params[:id])
  @task = current_user.@list.tasks.find_by(id: params[:id])
end

get '/tasks' do
  @tasks = current_user.tasks.all
  erb :'/tasks/index'
end

get '/tasks/new' do
  erb :'/tasks/new'
end

post '/tasks' do
  if @task.save
    redirect '/tasks'
  else
    @errors = list.errors.full_messages
    erb :'/tasks/new'
  end
end

get '/tasks/:id' do
  erb :'/tasks/show'
end

get '/tasks/:id/edit' do
  erb :'/tasks/edit'
end

put '/tasks/:id/edit' do
  if @task.update(params[:list])
    redirect '/tasks/#{@task.id}'
  else
    @errors = @list.errors.full_messages
    erb :'/tasks/edit'
  end
end

delete '/tasks/:id' do
  @task.destroy
  redirect '/lists'
end
