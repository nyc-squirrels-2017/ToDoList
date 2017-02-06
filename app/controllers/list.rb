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
