# Capistrano::Symfony

Provide some Symfony task for to use them in your Capistrano project.
For more flexibility it comes just whit tasks and it's nothing doing automatically on the Capistrano [flow][1].
If you need something from Symfony, so hook into the Capistrano [flow][1] by your self. 

## Installation

Add this line to your application's Gemfile:

```
# Gemfile
gem 'capistrano',  '~> 3.1'
gem 'capistrano-symfony-light', '~> 0.0.1'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install capistrano-symfony-light

## Usage

Require capistrano-symfony-light in your cap file

```
# Capfile
require 'capistrano/symfony'
```

### Settings

The following settings (displayed with defaults) are provided:

```ruby
# If you have a other name for your php, maybe like "php54 or php55" change it.
set :symfony_php,                       "php"

# If you use a diffrent php.ini change it and set the path.
set :symfony_php_ini,                   ""

# Set the roles for all tasks.
set :symfony_roles,                     :all

# Set the path in that is run all the tasks.
set :symfony_working_path,     ->       { fetch(:release_path) }

# Symfony application path
set :symfony_app_path,                  "app"

# Symfony web path
set :symfony_web_path,                  "web"

# Symfony log path
set :symfony_log_path,                  "#{fetch(:symfony_app_path)}/logs"

# Symfony cache path
set :symfony_cache_path,                "#{fetch(:symfony_app_path)}/cache"

# Symfony config file path
set :symfony_app_config_path,           "#{fetch(:symfony_app_path)}/config"

# Symfony console path
set :symfony_console_path,              "#{fetch(:symfony_app_path)}/console"

# Files to clear relative from :symfony_working_path
set :symfony_clear_files,               ["#{fetch(:symfony_web_path)}/app_*.php"]
```

### Integrated common tasks

The folowing common tasks are already integrated:
* ```symfony:assets:install```
* ```symfony:assetic:dump```
* ```symfony:cache:clear```
* ```symfony:cache:warmup```
* ```symfony:clear_files```
* ```symfony:build_bootstrap```

So you can use them with hooks like this:
```ruby
  after 'deploy:updated',   'symfony:assets:install'
  after 'deploy:updated',   'symfony:cache:clear'
```

Or if you need to pass some options:
```ruby
after :deploy, :updated do
  invoke "symfony:assetic:dump", "--env=prod"
  invoke "symfony:cache:clear", "--env=prod --no-debug"
end
```

If you need a not already provided task you can use "symfony:console"  
```ruby
after :deploy, :updated do
  invoke "symfony:console", "doctrine:schema:update", "--force"
end
```

[1]: http://capistranorb.com/documentation/getting-started/flow/

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request