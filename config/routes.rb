Rails.application.routes.draw do
  # Root path
  root 'pages#home'

  # Sessions (login/logout)
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'inscription' => 'utilisateurs#new', as: 'inscription'
   get 'logout'=>'sessions#destroy'
   

  

  # Admin sessions
  resources :admin_sessions, only: [:new, :create, :destroy]

  # Utilisateurs
  resources :utilisateurs, only: [:new, :create, :show, :edit, :update,:destroy] do
    member do
      get :show, as: 'profile'
      get :edit
    end
  end

  # Annonces avec routes custom pour les catégories
  resources :annonces do
    collection do
      get :electronique
      get :maison
      get :vetements
      get :livres
      get :sport
      get :showAnnonces  # Si nécessaire
    end
  end

  # Categories
  resources :categories

  # Health check
  get "up" => "rails/health#show", as: :rails_health_check

  # Suppression des routes inutiles :
  # - Toutes les routes get 'controller/action' sont remplacées par resources
  # - Les routes en double comme showA sont supprimées
end