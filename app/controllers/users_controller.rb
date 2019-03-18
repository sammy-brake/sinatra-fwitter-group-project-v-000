class UsersController < ApplicationController

configure do
  enable :sessions unless test?
  set :session_secret, "fwitter"
end

get '/signup' do
  erb :users/signup
end

# post '/signup' do
#   if params[:username].empty? || params[:password].empty? || params[:email].empty?
#     redirect :'users/signup'
#   else
#     @user = User.create(params)
#     # session[:user_id] = @user.id
#     redirect :'tweets/tweets'
#   end
# end

end
