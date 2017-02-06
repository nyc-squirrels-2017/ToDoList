# index
get '/lists/:l_id/tasks' do
  redirect "/lists/#{params[:l_id]}"
end

# show
# get '/lists/:l_id/tasks/:id' do
#
# end

# new
get '/lists/:l_id/tasks/new' do
  @list = List.find_by_id(params[:l_id])
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

end

put '/lists/:l_id/tasks/:id' do

end

# delete
delete '/lists/:l_id/tasks/:id' do

end
