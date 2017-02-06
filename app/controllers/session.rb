get '/session/login' do
  erb :'/session/login'
end

post '/session/login' do
  @user = User.find_by(username: params[:user][:username])
  if @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect "/"
  else
    @errors = ["Invalid login. Please try again"]
    erb :'/session/login'
  end
end

get '/session/logout' do
  session[:user_id] = nil
  redirect '/'
end
