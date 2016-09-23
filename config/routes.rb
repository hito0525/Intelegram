Rails.application.routes.draw do

resources :pictures, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
  collection do
      post :confirm
    end
  end


#get 'pictures' => 'pictures#index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
