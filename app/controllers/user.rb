get '/login' do 
	erb :login
end

get '/new' do
	erb :new_account
end

get '/logout' do
  session.clear
  redirect '/'
end

post '/new' do 
	user = User.create(params[:user])
	session[:user_id] = user.id
	redirect '/'
end

post '/login' do
	if @user = User.authenticate(params[:user])
		session[:user_id] = @user.id
		@session = session
		redirect '/'
	else
		erb :failed_login
	end
end