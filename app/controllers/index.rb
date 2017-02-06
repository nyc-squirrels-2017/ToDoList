get '/' do
  if login?
    redirect '/lists'
  else
    erb :index
  end
end
