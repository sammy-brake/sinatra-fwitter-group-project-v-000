class TweetsController < ApplicationController

get '/tweets' do
  if session[:user_id] != nil
    @user = User.find_by(session[:user_id])
    @tweets = Tweet.all
    erb :'/tweets/tweets'
  else
    redirect :"/login"
  end
end

get '/tweets/new' do
  # @user = User.find_by(session[:user_id])
  # if @user && @user.authenticate(params[:password])
  #   session[:user_id] = @user.id
    erb :'/tweets/new'
  # else
  #   redirect to :"/login"
  # end
end

post '/new' do
  @user = User.find_by(session[:user_id])
  @user.tweets << Tweet.create(params)
  erb :"/tweets/show_tweet"
end
#
# get '/tweets/:id' do
#   @tweet = Tweet.find(params[:id])
#   erb :'tweets/show_tweet'
# end

### just writing out future routes
# get '/tweets/:id/edit' do
# end

# post '/tweets/edit' do
#end

# post 'tweets/:id/delete' do
# end

end
