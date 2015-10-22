Rails.application.routes.draw do

  resources :users, only: [:index, :new, :create, :destroy, :show]
  resource :session, only: [:new, :create, :destroy]

  resources :bands do
    get 'albums/new'
  end
  resources :albums, only: [:edit, :show, :update, :destroy, :create] do
    get 'tracks/new'
  end
  resources :tracks, only: [:edit, :show, :update, :destroy, :create]


# new_album_track GET    /albums/:album_id/tracks/new(.:format) tracks#new
#          tracks POST   /tracks(.:format)                      tracks#create
#      edit_track GET    /tracks/:id/edit(.:format)             tracks#edit
#           track GET    /tracks/:id(.:format)                  tracks#show
#                 PATCH  /tracks/:id(.:format)                  tracks#update
#                 PUT    /tracks/:id(.:format)                  tracks#update
#                 DELETE /tracks/:id(.:format)                  tracks#destroy


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
