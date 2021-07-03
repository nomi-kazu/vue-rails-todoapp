Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    if Rails.env.production?
      origins 'https://vue-rails-42c43.web.app'
    else
      origins 'http://localhost:8080'
    end

    resource '*', 
      headers: :any,
      methods: [:get, :post, :patch, :put, :delete, :options, :head]
  end
end