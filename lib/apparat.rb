require 'sprout'

require 'apparat/dump'
require 'apparat/reducer'
require 'apparat/stripper'
require 'apparat/version'
require 'apparat/scala'

Sprout::Specification.new do |s|

  s.name    = Apparat::NAME
  s.version = Apparat::GEM_VERSION

  s.add_remote_file_target do |t|
    t.platform     = :universal
    t.archive_type = :zip
    t.url = Apparat::ZIP
    t.md5 = Apparat::MD5
    t.add_executable :dump, "apparat-#{Apparat::VERSION}/dump"
    t.add_executable :reducer, "apparat-#{Apparat::VERSION}/reducer"
    t.add_executable :stripper, "apparat-#{Apparat::VERSION}/stripper"
  end

  s.add_remote_file_target do |t|
    t.platform     = :universal
    t.archive_type = :zip
    t.url = Scala::ZIP
    t.md5 = Scala::MD5
  end

  #t.add_executable :asmifier, "apparat-#{Apparat::VERSION}/asmifier"
  #t.add_executable :concrete, "apparat-#{Apparat::VERSION}/concrete"
  #t.add_executable :coverage, "apparat-#{Apparat::VERSION}/coverage"
  #t.add_executable :jitb, "apparat-#{Apparat::VERSION}/jitb"
  #t.add_executable :tdsi, "apparat-#{Apparat::VERSION}/tdsi"

end
