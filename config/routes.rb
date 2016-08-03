Rails.application.routes.draw do
  get 'messages/reply'

  resources :photos
  post '/email_processor' => 'griddler/emails#create'
  post '/messages/reply' => 'messages#reply'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
