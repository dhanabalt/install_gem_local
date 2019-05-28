# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'install_gem_local/version'

Gem::Specification.new do |spec|
  spec.name          = 'install_gem_local'
  spec.version       = InstallGemLocal::VERSION
  spec.authors       = ['Dhanabal T']
  spec.email         = ['vel.dhanabal@gmail.com']

  spec.summary       = 'install the gem in my local'
  spec.description   = 'to build and install the gem in your local'
  spec.homepage      = 'https://github.com/dhanabalt/install_gem_local'
  spec.license       = 'MIT'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = ['install_gem_local']
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 2.0'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'

  # pretty puts
  spec.add_dependency 'awesome_print', '~> 1.8', '>= 1.8.0'
  # CLI options
  spec.add_dependency 'downup', '~> 0.11', '>= 0.11.7'
  # CLI
  spec.add_dependency 'thor', '~> 0.20', '>= 0.20.3'
  # Execute shell commands with pretty output
  spec.add_dependency 'tty-command', '~> 0.8', '>= 0.8.2'
end
