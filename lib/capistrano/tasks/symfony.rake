namespace :symfony do

  task :console, :command, :options do |t, args|
    on release_roles(fetch(:symfony_roles)) do
      within fetch(:symfony_working_path) do
        php_ini = fetch(:symfony_php_ini) || ''
        if php_ini.length > 0
          php_ini = ' -c ' + php_ini
        end
        execute fetch(:symfony_php), php_ini, fetch(:symfony_console_path), args[:command], args[:options]
      end
    end
    Rake::Task[t.name].reenable
  end

  desc "Build the bootstrap file"
  task :build_bootstrap, :options do |t, args|
    on release_roles(fetch(:symfony_roles)) do
      within fetch(:symfony_working_path) do
        php_ini = fetch(:symfony_php_ini) || ''
        if php_ini.length > 0
          php_ini = ' -c ' + php_ini
        end
        execute fetch(:symfony_php), php_ini, "./vendor/sensio/distribution-bundle/Sensio/Bundle/DistributionBundle/Resources/bin/build_bootstrap.php"
      end
    end
  end

  desc "Clear files"
  task :clear_files do
    next unless any? :symfony_clear_files
    on release_roles :all do
      within fetch(:symfony_working_path) do
        execute :rm, "-f", *fetch(:symfony_clear_files)
      end
    end
  end

  namespace :assets do
    desc "Install assets"
    task :install, :options do |t, args|
      invoke "symfony:console", "assets:install", args[:options]
    end
  end

  namespace :assetic do
    desc "Dump assets with Assetic"
    task :dump, :options do |t, args|
      invoke "symfony:console", "assetic:dump", args[:options]
    end
  end

  namespace :cache do
    desc "Clear the cache"
    task :clear, :options do |t, args|
      invoke "symfony:console", "cache:clear", args[:options]
    end

    desc "Warumup the cache"
    task :warmup, :options do |t, args|
      invoke "symfony:console", "cache:warmup", args[:options]
    end
  end
end