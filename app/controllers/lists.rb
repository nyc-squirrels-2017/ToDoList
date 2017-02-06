get '/lists' do
  @lists = current_user.lists.all
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

get '/lists/:id' do
  @list = current_user.lists.find_by(id: params[:id])
  erb :'/lists/show'
end

get '/lists/:id/edit' do
  @list = current_user.lists.find_by(id: params[:id])
  erb :'/lists/edit'
end

put '/lists/:id/edit' do
  @list = current_user.lists.find_by(id: params[:id])
  if @list.update(params[:list])
    redirect '/lists/#{@list.id}'
  else
    @errors = @list.errors.full_messages
    erb :'/lists/edit'
  end
end

delete '/lists/:id' do
  @list = current_user.lists.find_by(id: params[:id])
  @list.destroy
  redirect '/lists'
end
