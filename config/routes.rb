Rails.application.routes.draw do
  root to: 'visitors#index'
  get '/callback', to: 'visitors#callback'
  get '/feed', to: 'visitors#feed'
end
