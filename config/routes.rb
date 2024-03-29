Rails.application.routes.draw do
  root to: 'homes#top'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get 'users/withdraw_confirm'
  delete 'users/withdraw'
  resources :users, only: [:show, :edit, :update]
  resources :friends, only: [:index, :create, :destroy]
  resources :roles, except: [:index]
  post 'roles/:id' => "roles#copy_edit"
  get 'users/:id/roles' => "roles#index", as: :user_roles
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
