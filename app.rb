class App < Sinatra::Base
  enable :sessions

  before do
    if session.has_key?(:user_id)
      @user = User.get(session[:user_id])
    else
      @user = nil
    end
  end

  get '/' do
    @user = User.get(session[:user_id])
  	erb :index
  end

  get '/food' do
    @user = User.get(session[:user_id])
    erb :food
  end

  get '/contact' do
    @user = User.get(session[:user_id])
    erb :contact
  end

  get '/map' do
    erb :map
  end

  get '/attractions' do
    @user = User.get(session[:user_id])
    erb :attractions
  end

  get '/login' do
    erb :login
  end

  get '/signup' do

    erb :signup
  end

  post '/login' do
    username = params[:username]
    password = params[:password]

    db_user = User.first(name: username)
    unless db_user
      halt 401, "Unauthorized"
    end

    if db_user.password == password
      session[:user_id] = db_user.id
      redirect "/"
    else

    end

  end

end