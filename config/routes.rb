Rails.application.routes.draw do
	root 'research_units#index'
  resources :research_units
end
