get '/lists' do
  @list = List.all
   erb :"/lists/index"
end

get '/lists/new'do
erb :"/lists/new"
end

post '/lists' do
  list = List.new(params[:name])
end
