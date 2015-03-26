Rails.application.routes.draw do
  root to: "euphemisms#new"

  get '/words/fetch', to: "words#fetch", as: "fetch_words"
  get '/euphemisms/fetch'
  get '/euphemisms/popular'
  get '/euphemisms/:id/like', to: "euphemisms#like", as: "like_euphemism"
  get '/euphemisms/:id/dislike', to: "euphemisms#dislike", as: "displike_euphemism"

  resources :euphemisms, only: [:new, :index, :create]
end
