# index
get '/lists/:l_id/tasks' do
  redirect "/lists/#{params[:l_id]}"
end

# show
get '/lists/:l_id/tasks/:id' do

end

# new
get '/lists/:l_id/tasks/new' do

end

post '/lists/:l_id/tasks' do

end

# update
get '/lists/:l_id/tasks/:id/edit' do

end

put '/lists/:l_id/tasks/:id' do

end

# delete
delete '/lists/:l_id/tasks/:id' do

end
