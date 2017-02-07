get '/lists' do
  @lists = List.all
  erb :'lists/index'
end

get '/lists/new' do
  require_user
  @list = List.new
  if request.xhr?
    erb :'partials/_new_list', layout: false
  else
    erb :'lists/new'
  end
end

post '/lists' do
  @list = current_user.lists.create(name: params[:list])
   if request.xhr?
    erb :'partials/_recent_list', layout: false
  else
    redirect '/lists'
    end
end

get '/lists/:id' do
  @list = List.find(params[:id])
  erb :'lists/show'
end

get '/lists/:id/edit' do
  @list = List.find(params[:id])
  # authorized?(@list.user_id)
  erb :'/lists/edit'
end
#update
put '/lists/:id' do
  @list = List.find(params[:id])
  if @list.update(params[:list])
    redirect '/lists'
  else
    @errors = @list.errors.full_messages
    erb :'lists/edit'
  end
end
##DELETE
delete '/lists/:id' do
  @list = List.find(params[:id])
  @list.delete
  redirect '/lists'
end
