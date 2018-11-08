Rails.application.routes.draw do
  get '/', to: 'home#index', as: 'root'
  get '/:id', to: 'home#show', as: 'quotation'
  patch '/', to: 'home#update'
end
