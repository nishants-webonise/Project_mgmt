ProjectManagementSystem::Application.routes.draw do

  #resources :tasks
  #resources :stories
  #resources :projects
  resources :user_sessions

  resource :account, :controller => "users"

  resources :users do
    resources :projects do
      collection do
        get :list_projects
        get :new_project
        post :create_project
      end

      member do
        get :show_project_dashboard
        get :edit_project
        put :update_project
        delete :destroy_project
        get :add_project_users
        post :save_project_users
      end
      resources :stories do
        resources :tasks
      end
    end
  end

  resources :projects do
    resources :users

    member do
      get :add_project_users
      post :save_project_users
    end
  end

  match 'login' => 'user_sessions#new', :as => :login

  match 'logout' => 'user_sessions#destroy', :as => :logout

  match 'signup' => 'users#new', :as => :signup

  root :to => 'users#new'


  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
