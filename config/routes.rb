Rails.application.routes.draw do
  root 'home#index'

  namespace :api do
    resources :menus do
      resources :menu_items
    end
  end

# NO ROUTES BELOW THIS
  get '*unmatched_route', to: 'home#index'
end
