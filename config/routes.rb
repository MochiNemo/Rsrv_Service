Rails.application.routes.draw do
  root  'static_pages#home'
  get 'users/profile' => 'users#show'
  patch 'users/profile' => 'users#update'
  get 'users/account' => 'users#account'

  devise_for :users, :controllers => {
    :registrations  => 'users/registrations',
    :sessions       => 'users/sessions'   
  } 

end
