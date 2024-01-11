Rails.application.routes.draw do
  get 'top' => 'homes#top', as: 'top'
  resources :lists, only: [:new, :index, :create, :show, :edit, :update, :destroy]
end