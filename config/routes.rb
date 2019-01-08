Rails.application.routes.draw do
  get 'calculator/input'

  get 'calculator/output'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'calculator#input'
end
