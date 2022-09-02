# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically
# be available to Rake.

# This works around an issue with Rails 7 and dotenv-rails where
# tests are run in the wrong Rails environment

# This fix doesn't work with this version or Rails
# if Rake.application.top_level_tasks.grep(/^(default$|test(:|$))/).any?
#   ENV["RAILS_ENV"] ||= Rake.application.options.show_tasks ? "development" : "test"
# end

require_relative "config/application"

Rails.application.load_tasks
