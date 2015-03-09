require "capistrano/symfony/symfony"

namespace :load do
  task :defaults do
    load "capistrano/symfony/defaults.rb"
  end
end