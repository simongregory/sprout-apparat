lib = File.expand_path('lib', File.dirname(__FILE__))
$:.unshift lib unless $:.include?(lib)

require 'rubygems'
require 'bundler'

Bundler.require

require 'rake/testtask'
require 'rake/clean'

#############################################################################
#
# Standard tasks
#
#############################################################################

Rake::TestTask.new(:test) do |t|
  t.libs << "test/unit"
  t.test_files = FileList["test/unit/*_test.rb"]
  t.verbose = true
end

CLEAN.add '*.gem'

#############################################################################
#
# Packaging tasks
#
#############################################################################

task :release do
  puts ""
  print "Are you sure you want to release Apparat #{Apparat::GEM_VERSION}? [y/N] "
  exit unless STDIN.gets.index(/y/i) == 0

  unless `git branch` =~ /^\* master$/
    puts "You must be on the master branch to release!"
    exit!
  end

  # Build gem and upload
  sh "gem build apparat.gemspec"
  sh "gem push apparat-#{Apparat::GEM_VERSION}.gem"
  sh "rm apparat-#{Apparat::GEM_VERSION}.gem"

  # Commit
  sh "git commit --allow-empty -a -m 'v#{Apparat::GEM_VERSION}'"
  sh "git tag v#{Apparat::GEM_VERSION}"
  sh "git push origin master"
  sh "git push origin v#{Apparat::GEM_VERSION}"
end

task :install do
  sh "gem build apparat.gemspec"
  sh "gem install apparat-#{Apparat::GEM_VERSION}.gem"
end
