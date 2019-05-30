Rails.application.routes.draw do
  resources :favorite_theses
  resources :favorite_projects
  resources :favorite_courses
  resources :favorite_people
  resources :people
  root 'home#index'

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'main', to: 'home#main', as: 'main'
  get 'favorites', to: 'home#favorites', as: 'favorites'
  get 'p_details', to: 'home#p_details', as: 'p_details'
  get 'c_details', to: 'home#c_details', as: 'c_details'
  get 'pr_details', to: 'home#pr_details', as: 'pr_details'
  get 't_details', to: 'home#t_details', as: 't_details'
  get 'details', to: 'home#details', as: 'details'

  get 'signUp', to: 'users#new', as: 'signUp'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'searchPeople', to: 'search#searchPeople', as: 'searchPeople'
  get 'searchCourses', to: 'search#searchCourses', as: 'searchCourses'
  get 'searchProjects', to: 'search#searchProjects', as: 'searchProjects'
  get 'searchTheses', to: 'search#searchTheses', as: 'searchTheses'

  get 'resultpeople', to: 'search#resultpeople', as: 'resultpeople'
  get 'resultcourses', to: 'search#resultcourses', as: 'resultcourses'
  get 'resultprojects', to: 'search#resultprojects', as: 'resultprojects'
  get 'resulttheses', to: 'search#resulttheses', as: 'resulttheses'

  get 'addfavoriteperson', to: 'favorite_people#create', as: 'addfavoriteperson'
  get 'listfavoriteperson', to: 'favorite_people#index', as: 'listfavoriteperson'
  get 'addfavoritecourse', to: 'favorite_courses#create', as: 'addfavoritecourse'
  get 'listfavoritecourse', to: 'favorite_courses#index', as: 'listfavoritecourse'
  get 'addfavoriteproject', to: 'favorite_projects#create', as: 'addfavoriteproject'
  get 'listfavoriteproject', to: 'favorite_projects#index', as: 'listfavoriteproject'
  get 'addfavoritethese', to: 'favorite_theses#create', as: 'addfavoritethese'
  get 'listfavoritethese', to: 'favorite_theses#index', as: 'listfavoritethese'

  


end
