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
   @outstanding = @current_user.lists.reject { |list| list.complete? || list.tasks.empty? }
   @completed = @current_user.lists.select { |list| list.complete? || list.tasks.empty? }
   erb :"users/show"
end
