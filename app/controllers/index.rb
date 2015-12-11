get '/' do
  if session[:user_id]
    redirect '/surveys'
  else
    redirect '/sessions/new'
  end
end
