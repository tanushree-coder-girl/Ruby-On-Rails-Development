Rails.application.routes.draw do
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

  # get 'students/test'
  # resources :students, :courses, :blogs, :projects

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
