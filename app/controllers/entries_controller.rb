get '/users/:id/entries' do
	@user = User.find_by(id: params[:id])
	@entries = @user.entries
	erb :'entries/index'
end

get '/users/:user_id/entries/new' do 
  @user = User.find_by(id: params[:user_id])
  erb :'entries/new'
end

post '/users/:id/entries' do 
  @entry = Entry.new(params[:entry])
  if @entry.save
    redirect "/users/#{@entry.user_id}"
  else
    erb :'entries/new'
  end
end