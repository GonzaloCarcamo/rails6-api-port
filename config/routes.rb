Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :projects # rut api/v1/projects
    end
  end
end
