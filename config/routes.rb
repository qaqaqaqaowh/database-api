Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"
  resources :users
  resources :tickets
  post "users/:id/give_ticket" => "tickets#give_ticket"
  get "users/:id/tickets" => "tickets#user_tickets"
  post "users/:id/use_ticket" => "tickets#consume_ticket"
end
