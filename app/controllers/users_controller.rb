get '/users/:id' do
  @user = User.find_by(id: params[:id])
  erb :'user/show'
end

post '/users' do
  user = User.new(params)
  if user.save
    redirect '/'
  else
    erb :'/sessions/new', locals: { errors: user.errors.full_messages }
  end
end
