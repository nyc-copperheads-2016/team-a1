get '/users/new' do
  erb :"/user/new"
end


get '/users/:id' do
  if session[:user_id] != params[:id].to_i
    halt 401, "Not authorized to view user #{params[:id]}.\n"
  end
  @user = User.find_by(id: params[:id])
  @surveys = @user.surveys
  erb :'user/show'
end


post '/users' do
  user = User.new(params)
  if user.save
    session[:user_id] = user.id
    redirect '/'
  else
    redirect '/sessions/new?errors=incorrect_user_or_password'
  end
end
