get '/session/login' do
  erb :'/session/login'
end

post '/session/login' do
  user = User.find_by(username: params[:user][:username])
  if user && user.authenticate(params[:user][:password])
    session[:user_id] = user.id
    # session[:expire_after] = 60
    redirect '/'
  else
    @errors = ['Invalid Email/Password']
    erb :'/session/login'
  end
end

get '/session/logout' do
  session[:user_id] = nil
  redirect '/session/login'
end
