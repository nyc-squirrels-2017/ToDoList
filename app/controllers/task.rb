# index
get '/lists/:id/tasks' do
  redirect "/lists/#{params[:id]}"
end

# show
get '/lists/:id/tasks/:id' do

end

# new
get '/lists/:id/tasks/new' do

end

post '/lists/:id/tasks' do

end

# update
get '/lists/:id/tasks/:id/edit' do

end

put '/lists/:id/tasks/:id' do

end

# delete
delete '/lists/:id/tasks/:id' do
  
end
