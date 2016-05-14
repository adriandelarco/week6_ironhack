Rails.application.routes.draw do
  resources :matches, only: (:index)
  get '/matches/:faction', to: 'matches#show_by_faction'
  get '/matches/player/:id', to: 'matches#show_by_player_id'
  get '/matches/player/:player_id/faction/:id', to: 'matches#show_by_player_faction'
end
