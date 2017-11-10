# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'work_list/version'

Gem::Specification.new do |spec|
  spec.name = 'work_list'
  spec.version = WorkList::VERSION
  spec.authors = ['Cory Kaufman-Schofield']
  spec.email = ['cory@corykaufman.com']

  spec.summary = 'Better exception handling for operating on arrays'
  spec.homepage = 'https://github.com/allspiritseve/work_list'
  spec.license = 'MIT'

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.15'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'minitest', '~> 5.0'
end
