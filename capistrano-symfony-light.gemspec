# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-symfony-light'
  spec.version       = '1.0.0'
  spec.authors       = ['Remdan']
  spec.email         = ['hello@remdan.ch']

  spec.summary       = %q{Symfony support for Capistrano 3.4.x}
  spec.description   = %q{Provide some Symfony task for to use them in your capistrano project.}
  spec.homepage      = 'https://github.com/remdan/capistrano-symfony-light'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = ['lib']

  # No tests yet.
  # spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})

  spec.add_dependency 'capistrano', '~> 3.1.0'
end