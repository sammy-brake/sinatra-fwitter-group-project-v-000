class TweetsController < ApplicationController

get '/tweets' do
  if session[:user_id] != nil
    @user = User.find_by(session[:user_id])

    erb :'/tweets/tweets'
  else
    redirect :"/login"
  end
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
