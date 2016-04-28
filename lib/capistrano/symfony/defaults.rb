# If you have a other name for your php, maybe like "php54 or php55" change it.
set :symfony_php,                       "php"

# If you use a diffrent php.ini change it and set the path absolute to your root like "/etc/php55/php.ini".
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

# Folders that have be created relative from :symfony_working_path
set :symfony_create_folders,            ["#{fetch(:symfony_app_path)}/cache"]

# Symfony build_bootstrap.php path
set :symfony_build_bootstrap_path,      "./vendor/sensio/distribution-bundle/Resources/bin/build_bootstrap.php"