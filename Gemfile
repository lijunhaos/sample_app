source 'https://gems.ruby-china.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
#Bootstrap 框架本身使用 LESS 编写动态样式表,而 Rails 的 Asset Pipeline 默认支持的是(非常类似的)Sass 语言。 bootstrap-sass 会把 LESS 转换成 Sass,而且让 Bootstrap 中所有必要的文件都可以在当前应用中使用
gem 'bootstrap-sass'
# Use Puma as the app server,很好地处理巨大流量
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'sdoc',	group: :doc

#这个 gem 会使用半真实的名字和电子邮 件地址创建示例用户。
gem 'faker'

#bootstrap-will_paginate 的作用是设置 will_paginate 使用 Bootstrap 提供的分页样式。
gem 'will_paginate'
gem 'bootstrap-will_paginate'

#处理图片上传
gem 'carrierwave'
#用于调整图片尺寸
gem 'mini_magick'
#在生产环境中上传图片
gem 'fog'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  #gem 'byebug', '3.4.0'
  # Use sqlite3 as the database for Active Record
  gem 'sqlite3'
  gem 'spring'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  #gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rails-controller-testing'
	gem 'minitest-reporters'
	gem 'mini_backtrace'
	gem 'guard-minitest'
end

group :production do
	gem 'pg'
  gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
