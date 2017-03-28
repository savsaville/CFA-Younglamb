Rails.application.routes.draw do

  resources :posts do
    resources :comments
  end

  root 'pages#Home'
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
