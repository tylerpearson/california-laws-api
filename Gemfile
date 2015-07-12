source 'https://rubygems.org'

ruby '2.2.2'

gem 'rails', github: "rails/rails"
gem 'sprockets-rails', github: "rails/sprockets-rails"
gem 'arel', github: "rails/arel"
gem 'active_model_serializers', '~> 0.10.0.rc2'
gem 'kaminari'
gem 'annotate', '~> 2.6.6'
gem 'rack-cors'
gem 'puma'
gem 'elasticsearch-model'
gem 'elasticsearch-rails'

group :development, :test do
  gem 'byebug'
  gem 'mysql2'
end

group :development do
  gem 'web-console', github: 'rails/web-console'
  gem 'spring'
end

group :production do
  gem 'rails_12factor'
  gem 'pg'
  gem 'bonsai-elasticsearch-rails'
end
