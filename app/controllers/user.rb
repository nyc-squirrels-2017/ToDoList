get '/users' do
    require_login
    redirect "/users/#{current_user.id}"
end

get '/users/register' do
    erb :"/users/new"
end

post '/users' do
    @user = User.new(params[:user])
    
    if @user.save
      add_session(@user.id)
      redirect "/users" 
    else
      @errors = @user.errors.full_messages
      erb :"/users/new"
    end
end

get '/users/:id' do
   require_login
   erb :"users/show" 
end

