before '/lists*' do
  require_login
end

# new route
get '/lists/new' do
  if request.xhr?
    erb :"/lists/_newform", layout: false
  else
    erb :"/lists/new"
  end
end

post '/lists' do
  list = current_user.lists.create(params[:list])

  if list.save
    if request.xhr?
      erb :"/lists/_onelist", layout: false, locals: { list: list }
    else
      redirect '/lists'
    end
  else
    # @errors = list.errors.full_messages
    # erb :"/lists/new"
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

  if request.xhr?
      erb :"/lists/_editform", layout: false, locals: { list: @list }
  else
    erb :"/lists/edit"
  end
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

  if request.xhr?
    content_type :json
    {id: params[:id]}.to_json
  else
    redirect "/lists"
  end
end
