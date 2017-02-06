get '/users' do
    erb :"/users/index"
end

get '/users/register' do
    erb :"/users/new"
end

post '/users' do
    @user = User.new(params[:user])
    
    if @user.save
       redirect "/users" 
    else
       erb :"/users/new"
    end
end

get '/users/:id' do
    
    
end