ActionController::Routing::Routes.draw do |map|
  map.resources :people do |person|
    person.resources :accounts
    person.resources :contracts
    person.show_date 'date/:year_number/:month_number', :controller => 'people', :action => "show", :method => 'get'
  end

	map.resources :boxes do | box |
    box.show_date 'date/:year_number/:month_number', :controller => 'boxes', :action => "show", :method => 'get'
	  box.account 'accounts/:id', :controller => 'boxes', :action => 'account', :method => 'get'
    box.edit_account 'accounts/:id/edit', :controller => 'boxes', :action => 'account_edit'
    box.delete_account 'accounts/:id/delete', :controller => 'boxes', :action => 'account_delete'
  end

  map.resources :people
  map.resources :banks
  map.resources :bank_accounts do | bank_account |
    bank_account.show_date 'date/:year_number/:month_number', :controller => 'bank_accounts', :action => "show", :method => 'get'
	  bank_account.account 'accounts/:id', :controller => 'bank_accounts', :action => 'account', :method => 'get'
    bank_account.delete_account 'accounts/:id/delete', :controller => 'bank_accounts', :action => 'account_delete'
    bank_account.edit_account 'accounts/:id/edit', :controller => 'bank_accounts', :action => 'account_edit'
  end

  map.resources :sessions

  map.root :controller => :sessions, :action => :new
  map.session_logout 'session/logout', :controller => :sessions, :action => :destroy
  map.root :boxes

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  # map.root :controller => "welcome"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

