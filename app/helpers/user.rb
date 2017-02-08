def current_user
  @current_user ||= User.find_by(id: session[:user_id])
end

def login?
  !!current_user
end

def require_user
  redirect '/session/login' unless current_user
end

def authorized_user
  redirect '/' unless login? && current_user.id == @list.user_id
end
