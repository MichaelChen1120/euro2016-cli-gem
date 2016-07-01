# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'euro_2016/version'

Gem::Specification.new do |spec|
  spec.name          = "euro_2016"
  spec.version       = Euro2016::VERSION
  spec.authors       = ["Michael Chen"]
  spec.email         = ["michael.chen.1120@gmail.com"]

  spec.summary       = "Daily Euro 2016 Games"
  spec.description   = "Provides daily scores for Euro 2016"
  spec.homepage      = ""
  spec.license       = "MIT"



  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.executables   = ["euro-2016"]
  spec.require_paths = ["lib", "lib/euro_2016"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri"
end
