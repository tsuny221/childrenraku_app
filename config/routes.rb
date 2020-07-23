Rails.application.routes.draw do
  devise_for :users, skip: :all
  devise_scope :user do
    get 'users/sign_in' => 'users/sessions#new', as: 'new_user_session'
    post 'users/sign_in' => 'users/sessions#create', as: 'user_session'
    delete 'users/sign_out' => 'users/sessions#destroy', as: 'destroy_user_session'
    get 'users/sign_up' => 'users/registrations#new', as: 'new_user_registration'
    post 'users/sign_up' => 'users/registrations#create', as: 'user_registration'
    get 'users/password/new' => 'users/passwords#new', as: 'new_user_password'
    post 'users/password/new' => 'users/passwords#new', as: 'user_password'
    get 'users/invitation/accept' => 'users/invitations#edit', as: 'accept_user_invitation'
    get 'users/invitation/new' => 'users/invitations#new', as: 'new_user_invitation'
    put 'users/invitation/new' => 'users/invitations#update', as: ''
    post 'users/invitation/new' => 'users/invitations#create', as: 'user_invitation'
  end

  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'
    get 'admins/sign_up' => 'admins/registrations#new', as: 'new_admin_registration'
    post 'admins/sign_up' => 'admins/registrations#create', as: 'admin_registration'
    get 'admins/password/new' => 'admins/passwords#new', as: 'new_admin_password'
    post 'admins/password/new' => 'admins/passwords#new', as: 'admin_password'
  end

  root 'home#top'
  get 'about' => 'home#about', as: 'about'
  get 'signup/select' => 'home#signup_select', as: 'signup_select'
  get 'login/select' => 'home#login_select', as: 'login_select'
  get 'rooms/check' => 'rooms#check', as: 'check'
  resources :inquiries, only: [:create] do
    collection do
      post :confirm
    end
  end
  # get 'inquiries/confirm' => 'home#top', as: '/'
  # 共通
  namespace :admins do
    resources :rooms, only: [:new, :create, :edit, :update]
    # patch 'rooms/:id/edit' => 'rooms#update', as: 'edit_room'
    # post 'rooms/new' => 'rooms#create', as: 'new_room'
    get 'top' => 'home#top', as: 'top'
    resources :children, only: [:index, :show]
    # post 'contacts/confirm' => 'contacts#confirm', as: 'contacts_confirm'
    # get 'contacts/confirm' => 'contacts#new', as: 'new_contacts_confirm'
    resources :contacts, only: [:new, :create, :index, :show] do
      collection do
        post :confirm
      end
    end
    get 'room_access' => 'children#room_access', as: 'room_access'
    put 'room_access/enter' => 'children#enter', as: 'enter'
    put 'room_access/leave' => 'children#leave', as: 'leave'
    get 'room_access/mail' => 'children#mail', as: 'room_access_children_mail'
    get 'room_access/mail_all' => 'children#mail_all', as: 'room_access_mail_all'
    resources :users, only: [:show, :index, :destroy]
    resources :admins, only: [:show, :edit, :update]
    # patch 'admins/:id/edit' => 'admins#update', as: 'edit_admin'
    get '/confirm' => 'admins#confirm', as: 'confirm'
    put '/:id/hide' => 'admins#hide', as: 'hide'
    resources :plans, only: [:show, :index]
    resources :groups, only: [:new, :create, :index, :edit, :update]
  end
  # 管理者
  namespace :users do
    get 'top' => 'home#top', as: 'top'
    resources :children
    # post 'children/new' => 'children#create', as: 'new_child'
    # patch 'users/:id/edit' => 'users#update', as: 'edit_user'
    resources :users
    get '/confirm' => 'users#confirm', as: 'confirm'
    put '/:id/hide' => 'users#hide', as: 'hide'
    resources :contacts, only: [:index, :show] do
      member do
        get :read
      end
    end
    resources :plans, only: [:new, :index, :create, :update]
  end
  # ユーザー
end
