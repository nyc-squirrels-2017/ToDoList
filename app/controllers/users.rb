get '/users' do
  redirect '/'
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  @user = User.new(params[:user])
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :'/users/new'
  end
end

get '/users/:id' do
  require_user
  current_user.id == params[:id]
  @completed_tasks = current_user.tasks.find_by(completed:true)
  erb :'/users/show'
end

get '/users/:id/edit' do
  require_user
  current_user.id ==params[:id]
  erb :'/users/edit'
end

put '/users/:id' do
  require_user
  current_user.id ==params[:id]
  if current_user.update(params[:user])
    redirect "/users/#{current_user.id}"
  else
    @errors = @list.errors.full_messages
    erb :'/users/edit'
  end
end
