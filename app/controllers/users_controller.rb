post '/users' do
  user = User.new(params)
  if user.save
    redirect '/'
  else
    erb :'/sessions/new', locals: { errors: user.errors.full_messages }
  end
end
