Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    get 'users/sign_in' => 'users/sessions#new', as: 'new_user_session'
    post 'users/sign_in' => 'users/sessions#create', as: 'user_session'
    delete 'users/sign_out' => 'users/sessions#destroy', as: 'destroy_user_session'
    get 'users/sign_up' => 'users/registrations#new', as: 'new_user_registration'
    post 'users' => 'users/registrations#create', as: 'user_registration'
    get 'users/password/new' => 'users/passwords#new', as: 'new_user_password'
    get 'users/invitation/accept' => 'users/invitations#edit', as: 'accept_user_invitation'
    get 'users/invitation/new' => 'users/invitations#new', as: 'new_user_invitation'
    put 'users/invitation' => 'users/invitations#update', as: ''
    post 'users/invitation' => 'users/invitations#create', as: 'user_invitation'
  end

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
    get 'admins/sign_up' => 'admins/registrations#new', as: 'new_admin_registration'
    post 'admins' => 'admins/registrations#create', as: 'admin_registration'
    get 'admins/password/new' => 'admins/passwords#new', as: 'new_admin_password'
  end

  root 'home#top'
  get 'about' => 'home#about', as: 'about'
  get 'signup/select' => 'home#signup_select', as: 'signup_select'
  get 'login/select' => 'home#login_select', as: 'login_select'
  get 'rooms/check' => 'rooms#check', as: 'check'
  # 共通
  namespace :admins do
    resources :rooms, only: [:new, :create]
    get 'top' => 'home#top', as: 'top'
  end
  # 管理者
  namespace :users do
    get 'top' => 'home#top', as: 'top'
    resources :children
  end
end
