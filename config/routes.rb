Rails.application.routes.draw do
  root to: 'visitors#index'
  get '/callback' => 'visitors#callback'
end
