Rails.application.routes.draw do
  devise_for :admin, :controllers => { :sessions => "admin/sessions" }

  root to: "home#index"

  authenticated :admin do
    resources :members
  end
end
