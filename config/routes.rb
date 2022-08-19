Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  get 'health', to: proc { [200, {}, ['OK']] }

  mount Weather => "/"
end
