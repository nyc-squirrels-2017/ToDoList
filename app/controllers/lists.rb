get '/lists' do
  @lists = List.all
  erb :'/lists/index'
end

get '/lists/new'do
erb :'lists/new'
end



get '/lists/:id' do
  @list = List.find(params[:id])
  erb :"/lists/show"
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
