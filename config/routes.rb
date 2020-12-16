Rails.application.routes.draw do

  namespace 'admin' do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
  end

  devise_for :users
  root 'abouts#index'
  get 'abouts', to: 'abouts#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
