before '/lists*' do
  require_login
end

# new route
get '/lists/new' do

  erb :"/lists/new"
end

post '/lists' do
  list = current_user.lists.create(params[:list])

  if list.save
    redirect '/lists'
  else
    @errors = list.errors.full_messages
    erb :"/lists/new"
  end
end

# index route
get '/lists' do
  @lists = current_user.lists
  erb :'/lists/index'
end

# show route
get '/lists/:id' do
  @list = List.find_by_id(params[:id])
  erb :"/lists/show"
end


# update
get '/lists/:id/edit' do
  @list = List.find_by_id(params[:id])
  erb :"/lists/edit"
end

put '/lists/:id' do
  @list = List.find_by_id(params[:id])

  if @list.update(params[:list])
    redirect "/lists"
  else
    @errors = @list.errors.full_messages
    erb :"/lists/edit"
  end
end

# delete
delete '/lists/:id' do
  List.find_by_id(params[:id]).destroy

  redirect "/lists"
end
