Rails.application.routes.draw do
  resources :products do
    collection do
      post "sort",to: "products#sort"
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
