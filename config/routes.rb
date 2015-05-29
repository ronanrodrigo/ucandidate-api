require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      get :authorization, to: "authorizations#authorization"
      resources :candidates, only: [:show, :create]
    end
  end
end
