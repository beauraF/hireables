# frozen_string_literal: true

Rails.application.routes.draw do
  resources :exports, only: %i[new create]
  get '/exports', to: redirect('/')

  root to: 'exports#new'
end
