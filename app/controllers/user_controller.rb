get '/' do
	redirect '/users'
end

get '/users' do
	@users = User.all
	erb :'users/index'
end

get '/users/new' do
	@user = User.new
	erb :'/user/new'
end

post '/users' do
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		@errors = @user.errors.full_messages
		erb :'/users/new'
	end
end

get '/users/:id' do
	@user = User.find_by(id: params[:id])
	erb :'/user/show'
end
