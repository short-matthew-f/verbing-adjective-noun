Rails.application.routes.draw do
  root to: "euphemisms#new"

  get '/words/fetch', to: "words#fetch", as: "fetch_words"
  get '/euphemisms/fetch', to: "euphemisms#fetch", as: "fetch_euphemism"

  resources :euphemisms, only: [:index, :create]
end
