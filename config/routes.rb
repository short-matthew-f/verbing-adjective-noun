Rails.application.routes.draw do
  root to: "static#home"

  resources :words
  resources :euphemisms

  get '/random', to: "euphemisms#random", as: "random_euphemism"
  get '/aliterative', to: "euphemisms#aliterative", as: "aliterative_euphemism"
end
