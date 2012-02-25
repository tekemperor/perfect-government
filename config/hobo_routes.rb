# This is an auto-generated file: don't edit!
# You can add your own routes in the config/routes.rb file
# which will override the routes in this file.

PerfectGovernment::Application.routes.draw do


  # Lifecycle routes for controller "users"
  post 'users/signup(.:format)' => 'users#do_signup', :as => 'do_user_signup'
  get 'users/signup(.:format)' => 'users#signup', :as => 'user_signup'
  put 'users/:id/activate(.:format)' => 'users#do_activate', :as => 'do_user_activate'
  get 'users/:id/activate(.:format)' => 'users#activate', :as => 'user_activate'
  put 'users/:id/reset_password(.:format)' => 'users#do_reset_password', :as => 'do_user_reset_password'
  get 'users/:id/reset_password(.:format)' => 'users#reset_password', :as => 'user_reset_password'

  # Resource routes for controller "users"
  get 'users/:id/edit(.:format)' => 'users#edit', :as => 'edit_user'
  get 'users/:id(.:format)' => 'users#show', :as => 'user', :constraints => { :id => %r([^/.?]+) }
  post 'users(.:format)' => 'users#create', :as => 'create_user'
  put 'users/:id(.:format)' => 'users#update', :as => 'update_user', :constraints => { :id => %r([^/.?]+) }
  delete 'users/:id(.:format)' => 'users#destroy', :as => 'destroy_user', :constraints => { :id => %r([^/.?]+) }

  # Show action routes for controller "users"
  get 'users/:id/account(.:format)' => 'users#account', :as => 'user_account'

  # User routes for controller "users"
  match 'login(.:format)' => 'users#login', :as => 'user_login'
  get 'logout(.:format)' => 'users#logout', :as => 'user_logout'
  match 'forgot_password(.:format)' => 'users#forgot_password', :as => 'user_forgot_password'


  # Resource routes for controller "ideas"
  get 'ideas(.:format)' => 'ideas#index', :as => 'ideas'
  get 'ideas/new(.:format)', :as => 'new_idea'
  get 'ideas/:id/edit(.:format)' => 'ideas#edit', :as => 'edit_idea'
  get 'ideas/:id(.:format)' => 'ideas#show', :as => 'idea', :constraints => { :id => %r([^/.?]+) }
  post 'ideas(.:format)' => 'ideas#create', :as => 'create_idea'
  put 'ideas/:id(.:format)' => 'ideas#update', :as => 'update_idea', :constraints => { :id => %r([^/.?]+) }
  delete 'ideas/:id(.:format)' => 'ideas#destroy', :as => 'destroy_idea', :constraints => { :id => %r([^/.?]+) }

end
