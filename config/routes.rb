Rails.application.routes.draw do
  default_url_options :host => "example.com"
  devise_for :users
  authenticated :user do
    root to: 'groups#index', as: :authenticated_root
  end

  unauthenticated do
    root to: 'pages#splash', as: :unauthenticated_root
  end

  resources :groups do
    resources :operations
  end
end
