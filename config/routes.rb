Rails.application.routes.draw do
  devise_for :admin, :controllers => { :sessions => "admin/sessions" }

  devise_scope :admin do
    get 'admin', to: 'admin/sessions#new'
  end

  namespace 'admin' do
    resources :members
  end
  

  root to: "home#index"
  
end
