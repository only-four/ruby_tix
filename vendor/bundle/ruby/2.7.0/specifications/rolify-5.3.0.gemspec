# -*- encoding: utf-8 -*-
# stub: rolify 5.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rolify".freeze
  s.version = "5.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Florent Monbillard".freeze, "Wellington Cordeiro".freeze]
  s.date = "2020-06-01"
  s.description = "Very simple Roles library without any authorization enforcement supporting scope on resource objects (instance or class). Supports ActiveRecord and Mongoid ORMs.".freeze
  s.email = ["f.monbillard@gmail.com".freeze, "wellington@wellingtoncordeiro.com".freeze]
  s.homepage = "https://github.com/RolifyCommunity/rolify".freeze
  s.licenses = ["MIT".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3".freeze)
  s.rubygems_version = "3.2.6".freeze
  s.summary = "Roles library with resource scoping".freeze

  s.installed_by_version = "3.2.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<ammeter>.freeze, ["~> 1.1"])
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_development_dependency(%q<rspec-rails>.freeze, ["~> 3.8"])
  else
    s.add_dependency(%q<ammeter>.freeze, ["~> 1.1"])
    s.add_dependency(%q<bundler>.freeze, ["~> 2.0"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.3"])
    s.add_dependency(%q<rspec-rails>.freeze, ["~> 3.8"])
  end
end
