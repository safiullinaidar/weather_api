Rails.application.routes.draw do
  get 'health', to: proc { [200, {}, ['OK']] }

  mount Weather => "/"
end
