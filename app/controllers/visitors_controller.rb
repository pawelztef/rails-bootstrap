class VisitorsController < ApplicationController

  def callback
    # TODO redirect_uri refactor
    response = Instagram.get_access_token(params[:code], :redirect_uri => 'http://localhost:3000/callback')
    session[:access_token] = response.access_token
    redirect_to feed_url
  end

  def feed
byebug
  end

end
