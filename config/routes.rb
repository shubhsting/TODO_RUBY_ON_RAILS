Rails.application.routes.draw do
  # this is used to extend routes after /.i mean the upper do will stretch the 
  # localhost:3000 to /my_lists and the lower one will further stretch it to 
  # my_lists/:id/todo_items/:id
  resources :my_lists do
    resources:todo_items
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'my_lists#index'
end
