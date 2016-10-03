Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
devise_for :users, controllers: {
    omniauth_callbacks: "users/omniauth_callbacks"
  }
resources :pictures, only: [:index, :show, :new, :create, :edit, :update, :destroy] do
  collection do
      post :confirm
    end
  end

root 'top#index'


# if Rails.env.development?
#   mount LetterOpenerWeb::Engine, at: "/letter_opener"
# end


#get 'pictures' => 'pictures#index'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
