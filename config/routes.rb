Lethalbot::Application.routes.draw do
	root to: "games#index"
	resources :game
end
