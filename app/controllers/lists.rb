get '/lists' do
  @lists = current_user.lists
  erb :'/lists/index'
end

get '/lists/new' do
  erb :'/lists/new'
end

post '/lists' do
  new_list = current_user.lists.new(params[:list])
  if new_list.save
    redirect '/lists'
  else
    @errors = list.errors.full_messages
    erb :'/lists/new'
  end
end

before '/lists/:list_id*' do
  @list = current_user.lists.find_by(id: params[:list_id])
end

get '/lists/:list_id' do
  # @list = current_user.lists.find_by(id: params[:id])
  erb :'/lists/show'
end

get '/lists/:list_id/edit' do
  # @list = current_user.lists.find_by(id: params[:id])
  erb :'/lists/edit'
end

put '/lists/:list_id/edit' do
  # @list = current_user.lists.find_by(id: params[:id])
  if @list.update(params[:list])
    redirect '/lists/#{@list.id}'
  else
    @errors = @list.errors.full_messages
    erb :'/lists/edit'
  end
end

delete '/lists/:list_id' do
  # @list = current_user.lists.find_by(id: params[:id])
  @list.destroy
  redirect '/lists'
end
