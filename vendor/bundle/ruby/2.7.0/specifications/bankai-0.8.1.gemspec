# -*- encoding: utf-8 -*-
# stub: bankai 0.8.1 ruby lib

Gem::Specification.new do |s|
  s.name = "bankai".freeze
  s.version = "0.8.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["5xRuby".freeze, "\u84BC\u6642\u5F26\u4E5F".freeze]
  s.bindir = "exe".freeze
  s.date = "2020-12-07"
  s.description = "The tool to generate Rails template for 5xRuby".freeze
  s.email = ["hi@5xruby.tw".freeze, "contact0@frost.tw".freeze]
  s.executables = ["bankai".freeze]
  s.files = ["exe/bankai".freeze]
  s.homepage = "https://github.com/5xRuby/bankai".freeze
  s.required_ruby_version = Gem::Requirement.new(">= 2.6.6".freeze)
  s.rubygems_version = "3.2.6".freeze
  s.summary = "The Rails template for 5xRuby".freeze

  s.installed_by_version = "3.2.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4
  end

  if s.respond_to? :add_runtime_dependency then
    s.add_development_dependency(%q<bundler>.freeze, ["~> 2.1.4"])
    s.add_development_dependency(%q<bundler-audit>.freeze, [">= 0"])
    s.add_development_dependency(%q<overcommit>.freeze, [">= 0"])
    s.add_development_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_development_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_development_dependency(%q<rspec_junit_formatter>.freeze, [">= 0"])
    s.add_development_dependency(%q<rubocop>.freeze, ["~> 0.81.0"])
    s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.17.1"])
    s.add_runtime_dependency(%q<rails>.freeze, [">= 5.2.0"])
  else
    s.add_dependency(%q<bundler>.freeze, ["~> 2.1.4"])
    s.add_dependency(%q<bundler-audit>.freeze, [">= 0"])
    s.add_dependency(%q<overcommit>.freeze, [">= 0"])
    s.add_dependency(%q<rake>.freeze, ["~> 12.0"])
    s.add_dependency(%q<rspec>.freeze, ["~> 3.0"])
    s.add_dependency(%q<rspec_junit_formatter>.freeze, [">= 0"])
    s.add_dependency(%q<rubocop>.freeze, ["~> 0.81.0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.17.1"])
    s.add_dependency(%q<rails>.freeze, [">= 5.2.0"])
  end
end
