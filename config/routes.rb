Rails.application.routes.draw do
  devise_for :users
  root 'dashboard#index'

  match '/tickets' => 'dashboard#tickets', :via => :post, :as => :tickets
  get '/tickets/:id' => 'dashboard#show'

  namespace :admin do
    root 'dashboard#index'
    get '/assign_for_me_ticket/:id' => 'dashboard#assign_for_me_ticket', :via => :get, :as => :assign_for_me_ticket
    get '/reassign_ticket/:id' => 'dashboard#reassign_ticket', :via => :get, :as => :reassign_ticket
    get '/start_working_ticket/:id' => 'dashboard#start_working_ticket', :via => :get, :as => :start_working_ticket
    get '/send_question_to_requester/:id' => 'dashboard#send_question_to_requester', :via => :get, :as => :send_question_to_requester
    get '/finished_ticket/:id' => 'dashboard#finished_ticket', :via => :get, :as => :finished_ticket
    get '/show_history_ticket/:id' => 'dashboard#show_history_ticket', :via => :get, :as => :show_history_ticket
  end


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
