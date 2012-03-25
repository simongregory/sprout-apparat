# -*- encoding: utf-8 -*-
lib = File.expand_path File.join(File.dirname(__FILE__), 'lib')
$:.unshift lib unless $:.include?(lib)

require 'bundler'
require 'apparat/version'

Gem::Specification.new do |s|
  s.name                       = Apparat::NAME
  s.version                    = Apparat::GEM_VERSION
  s.platform                   = Gem::Platform::RUBY
  s.authors                    = ["Simon Gregory"]
  s.email                      = "projectsprouts@googlegroups.com"
  s.homepage                   = "http://projectsprouts.org"
  s.summary                    = "Apparat is a framework to work with ABC, SWC and SWF files."
  s.description                = "Project Sprouts support for Apparat"
  s.required_rubygems_version  = ">= 1.3.6"
  s.files                      = Dir['**/*']
  s.files.reject!              { |fn| fn.match /\.(DS_Store|svn|git|tmproj|gem)|tmp/ }
  s.add_dependency             'sprout', '>= 1.1.15.pre'
  s.add_development_dependency 'shoulda'
  s.require_paths << 'lib'
end

