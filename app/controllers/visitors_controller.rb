class VisitorsController < ApplicationController


  def callback
    response = Instagram.get_access_token(params[:code], :redirect_uri => ENV["redirect_uri"])
    session[:access_token] = response.access_token
    redirect_to feed_url
  end

  def feed
    client = Instagram.client(:access_token => session[:access_token])
    @user = client.user 
    response = client.user_recent_media
    album = [].concat(response)
    max_id = response.pagination.next_max_id
    while !(max_id.to_s.empty?) do
      response = client.user_recent_media(:max_id => max_id)
      max_id = response.pagination.next_max_id
      album.concat(response)
    end
    @album = album
  end

  def signout
    session[:access_token] = nil
    redirect_to root_url
  end

end
