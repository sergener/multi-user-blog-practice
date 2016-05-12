get '/login' do
  @user = User.find_by(id: session[:user_id])
  erb :'/sessions/new'
end

post '/login' do
   @user = User.find_by(username: params[:username])
     if @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/'
    else
      erb :'/sessions/new'
    end
end

get '/logout' do
  session.clear
  redirect '/'
end