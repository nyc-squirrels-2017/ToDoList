get '/lists' do
  @lists = List.all
  erb :'/lists/index'
end

get '/lists/new'do
erb :'lists/new'
end


post '/lists' do
  @list = List.new(params[:list])
  @list.user_id = current_user.id
  # binding.pry
  if @list.save
    redirect '/lists'
  else
    erb :"/lists/new"
  end
end

get '/lists/:id' do
  @list = current_user.lists.find_by(id: params[:id])
  @tasks = @list.tasks
  erb :"/lists/show"
end


get '/lists/:id/edit' do
  @list = current_user.lists.find_by(id: params[:id])
  erb:'/lists/edit'

end

put '/lists/:id/edit' do
  @list = current_user.lists.find_by(id: params[:id])
  # binding.pry
  if @list.update(name: params[:lists][:name])
    redirect "/lists/#{@list.id}"
  else
    @errors = @list.errors.full_messages
    redirect "/lists/#{@list.id}/edit"
  end
end

delete '/lists/:id' do
  @list = List.find_by(id: params[:id])
  @list.destroy
  redirect '/lists'
end
