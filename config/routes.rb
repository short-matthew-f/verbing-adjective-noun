Rails.application.routes.draw do
  root to: "euphemisms#new"

  get '/words/fetch', to: "words#fetch", as: "fetch_words"
  post '/euphemisms', to: "euphemisms#create", as: "euphemisms"
end
