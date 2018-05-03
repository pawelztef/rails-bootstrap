module ApplicationHelper

  def sign_link
    if session[:access_token].nil?
      content_tag :li do
        link_to 'Sign in with Instagram', Instagram.authorize_url(redirect_uri: "http://localhoxst:3000/callback")
        # link_to 'Sign in with Instagram', Instagram.authorize_url(redirect_uri: 'https://obscure-peak-36944.herokuapp.com/callback')
      end
    else
      content_tag :li do
        link_to 'Sign out', signout_path
      end
    end
  end

  def feed_link
    content_tag :li do
      link_to('Feed', feed_path) unless session[:access_token].nil?
    end
  end

end
