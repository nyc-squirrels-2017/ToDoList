get '/' do
  if login?
    redirect '/lists'
  else
    redirect '/session/login'
  end
end
