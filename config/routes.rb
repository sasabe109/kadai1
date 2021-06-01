Rails.application.routes.draw do
  devise_for :users
  get 'pages/index', to: 'pages#index'
  get 'pages/show', to: 'pages#show'

  get 'home/top' , to: 'home#top'


  get 'make_event' , to: 'eventpage#make_event'
  get 'event_list' , to: 'eventpage#event_list'
  get 'schedule'  ,  to: 'eventpage#schedule'
  post 'create' , to: 'eventpage#create'
  get 'show_event/:id' , to: 'eventpage#show_event'
  get 'edit_event/:id', to: 'eventpage#edit_event'
  post 'update/:id', to: 'eventpage#update'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
