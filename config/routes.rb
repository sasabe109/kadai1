Rails.application.routes.draw do

  devise_for :users, controllers: {
        registrations: 'users/registrations' ,
        sessions: 'users/sessions'
      }
  
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
  get 'destroy/:id', to: 'eventpage#destroy'
  post 'exit_event/:id' , to: 'eventpage#exit'
  post 'join_event/:id' , to: 'eventpage#join'
  get 'event_member/:id' , to: 'eventpage#memberlist'
  get 'myevent' , to: 'eventpage#myevent'
  post 'close_event/:id' , to: 'eventpage#close'
  get 'match_day/:id' , to: 'eventpage#match_day'
  post 'decide_date/:id' , to: 'eventpage#decide_date'
  post 're_decide_date/:id' , to: 'eventpage#re_decide_date'
  get 'planning/result/:id' , to: 'eventpage#result'
  post 'close_match_day/:id' , to: 'eventpage#close_match_day'
  post 'open_match_day/:id' , to: 'eventpage#open_match_day'
    # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
