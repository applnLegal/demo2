# -*- encoding: utf-8 -*-
# stub: rails_kindeditor 0.5.1 ruby lib

Gem::Specification.new do |s|
  s.name = "rails_kindeditor".freeze
  s.version = "0.5.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Macrow".freeze]
  s.date = "2017-11-09"
  s.description = "rails_kindeditor will helps your rails app integrate with kindeditor, including images and files uploading.".freeze
  s.email = "Macrow_wh@163.com".freeze
  s.homepage = "http://github.com/Macrow".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.0.6".freeze
  s.summary = "Kindeditor for Ruby on Rails".freeze

  s.installed_by_version = "3.0.6" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<jquery-rails>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<carrierwave>.freeze, [">= 0"])
      s.add_runtime_dependency(%q<mini_magick>.freeze, [">= 0"])
    else
      s.add_dependency(%q<jquery-rails>.freeze, [">= 0"])
      s.add_dependency(%q<carrierwave>.freeze, [">= 0"])
      s.add_dependency(%q<mini_magick>.freeze, [">= 0"])
    end
  else
    s.add_dependency(%q<jquery-rails>.freeze, [">= 0"])
    s.add_dependency(%q<carrierwave>.freeze, [">= 0"])
    s.add_dependency(%q<mini_magick>.freeze, [">= 0"])
  end
end
