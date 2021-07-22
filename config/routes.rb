# frozen_string_literal: true

Rails.application.routes.draw do
  root 'root#index'
  resources :test_models, only: :index
end
