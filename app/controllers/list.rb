before '/lists' do
  require_login
end

# index
get '/lists' do
  @lists = current_user.lists
  erb :'/lists/index'
end

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
