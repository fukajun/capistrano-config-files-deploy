# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/config_files_deploy/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-config-files-deploy"
  spec.version       = Capistrano::ConfigFilesDeploy::VERSION
  spec.authors       = ["fukajun"]
  spec.email         = ["fukajun.shark@gmail.com"]

  spec.summary       = %q{Deploy config files via Capistrano.}
  spec.description   = %q{Deploy config files via Capistrano.}
  spec.homepage      = "https://github.com/fukajun/capistrano-config-files-deploy"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "capistrano", "~> 3.1"

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
end
