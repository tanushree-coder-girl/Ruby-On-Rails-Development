Rails.application.routes.draw do
  devise_for :admin_users
   resources :projects
   resources :courses
  # Add own custom root path
  root 'welcome#index'

  # add a get route 
  # get '/about' , to:'welcome#about'
  get '/about' => 'welcome#about'

  get 'welcome/contact'

  # resources routing 
   resources :students
   resources :blogs

  # dashboard
  namespace :admin do 
    resources :students
    resources :courses
    resources :projects
    resources :blogs
    get 'dashboard' => 'dashboard#index'
  end

  # get 'students/test'
  # resources :students, :courses, :blogs, :projects

  # Member and collection route 
  # resources :students do 
  #   member do 
  #     get :personal_details
  #   end
  #   # 2nd way of memeber action 
  #   # get :personal_details, on: :member

  #   collection do
  #     get :active
  #   end
  #   2nd way of collection action 
  #   get :active, on: :collection
  # end

  # by default it will considered as member route 
  # resources :blogs do 
  #   get :my_new_route
  # end

  # # Namespace and scoped routing 
  # namespace :admin do 
  #   resources :students
  # end

  # scope module: :admin do 
  #   resources :students
  # end

  # scope :admin do 
  #   resources :students
  # end
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
