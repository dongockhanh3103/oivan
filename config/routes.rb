Rails.application.routes.draw do

  namespace :admin do
    resources :users, only: [:index, :show, :edit, :update, :destroy]
    resources :quizzes, only: [:index, :show, :edit, :update, :destroy, :new, :create]
  end

  namespace :api do
    namespace :v1 do
      resource :authen_token, only: [:create, :destroy] do
        post :refresh_token
      end

      resources :quizzes, only: [:index] do
        member do
          get :questions, to: 'quizzes#get_questions'
        end
      end

      resources :take_quizzes, only: [:create, :show]
    end
  end

  devise_for :users
  root 'abouts#index'
end
