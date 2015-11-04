Rails.application.routes.draw do
  
  resources :videos
  resources :courses do
    resources :units do
      resources :pages
    end
  end
  
  get 'editor' => 'editor#video', :as => :video_editor
  post 'saveAnswer' => 'pages#saveAnswer'
  
  devise_for :users, controllers: { 
    omniauth_callbacks: 'users/omniauth_callbacks', 
    registrations: "users/registrations",
    sessions: "users/sessions" }
  
  root :to => 'courses#index'
end
