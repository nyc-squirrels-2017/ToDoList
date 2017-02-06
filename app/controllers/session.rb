get '/sessions' do
  redirect '/sessions/login' 
end

get '/sessions/login' do
  erb :"/sessions/new"
end

post '/sessions' do
  @user = User.find_by_username(params[:username])
  
  if @user && @user.authenticate(params[:password])
      add_session(@user.id)
      redirect "/"
  else
      @errors = ["Invalid Username or Password"]
      erb :"/sessions/new"
  end
end

get '/sessions/logout' do
    require_login
    remove_session
    redirect "/"
end