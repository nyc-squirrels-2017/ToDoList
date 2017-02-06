get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  user = User.new(params[:user])
  if user.save
    session[:user_id] = user.id
    # session[:expire_after] = 60 #dont remember learning this?
    redirect '/' #have to update this later
  else
    @errors = user.errors.full_messages
    erb :'/users/new'
  end
end
