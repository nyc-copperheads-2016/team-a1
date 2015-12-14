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
    erb :'/sessions/new', locals: {errors: user.errors.full_messages}
  end
end
