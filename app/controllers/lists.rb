get '/lists' do
  @lists = List.where(user_id: session[:user_id])
  erb :'/lists/index'
end

get '/lists/new' do #make sure the new form page goes before the show page
  require_user
  if request.xhr?
    erb :'/lists/new', layout: false
  else
    erb :'/lists/new'
  end
end

get "/lists/:id" do
  @list = List.find_by(id: params[:id])
  authorized_user
  erb :'/lists/show'
end

get "/lists/:id/edit" do
  @list = List.find_by(id: params[:id])
  authorized_user
  erb :'/lists/edit'
end

post '/lists' do
  list = List.new(params[:list])
  list.user_id = session[:user_id]
  if request.xhr?
    if list.save
      erb :"/partials/_single_user", layout: false, locals:{list:list}
    else
      status 422
      @errors = list.errors.full_messages
      erb :'/partials/_errors', layout: false
    end
  else
    if list.save
      redirect '/lists' #have to update this later
    else
      @errors = list.errors.full_messages
      erb :'/lists/new'
    end
  end
end

put '/lists/:id' do
  list = List.find_by(id: params[:id])
  list.update(params[:list])
  redirect "/lists/#{params[:id]}"
end

delete '/lists/:id' do
  list = List.find_by(id: params[:id])
  list.destroy()
  redirect '/lists'
end
