get '/session/login' do
erb :"/session/login"
end


post '/session/login'do
user = User.find_by(username: params[:user][:username])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    redirect '/'
  else
  @errors = ['Something went Wrong.']
  erb :'/session/login'
  end
end


get '/session/logout' do
  session[:user_id] = nil
  redirect '/session/login'
end
