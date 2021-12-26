Rails.application.routes.draw do

  root  'static_pages#home'
  get   'users/profile'             => 'users#show'
  patch 'users/profile'             => 'users#update'
  get   'users/account'             => 'users#account'
  get   'rooms/post'                => 'rooms#show_rooms'
  get   'rooms/search'              => 'rooms#search'
  post  'reservations/confirm(/id)' => 'rooms#confirm'
  post  'reservations/back'         => 'rooms#back'
  post  'reservations/complete'     => 'rooms#complete'
  get   '/reservations'             => 'rsrvs#show'

  devise_for :users, :controllers => {
    :registrations  => 'users/registrations',
    :sessions       => 'users/sessions'   
  } 
  
  resources :rooms

end
