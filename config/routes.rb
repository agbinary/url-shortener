Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      post 'urls/shorten', to: 'urls#shorten', as: :shorten
    end
  end

  get '/:shortened_url', to: 'urls#expand', as: :expand
end
