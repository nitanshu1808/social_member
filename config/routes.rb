Rails.application.routes.draw do
  devise_for :admin,  :controllers => { :sessions => "admin/sessions" }
  devise_for :members, :controllers => { :sessions => "members/sessions" }

  devise_scope :admin do
    get 'admin', to: 'admin/sessions#new'
  end

  namespace 'admin' do
    resources :members, only: [ :index, :new, :create ] do
      resources :headings, only: [ :index ]
    end
  end
  

  root to: "home#index"

  resources :members, only: [:index, :show] do
    get 'search', on: :collection
  end

end
