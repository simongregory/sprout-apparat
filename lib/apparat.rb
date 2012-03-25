require 'sprout'

require 'apparat/dump'
require 'apparat/reducer'
require 'apparat/version'

Sprout::Specification.new do |s|

  s.name    = Apparat::NAME
  s.version = Apparat::VERSION

  s.add_remote_file_target do |t|
    t.platform     = :universal
    t.archive_type = :zip
    t.url = Apparat::ZIP
    t.md5 = Apparat::MD5
    t.add_executable :reducer, "apparat-#{Apparat::VERSION}/reducer"
    #t.add_executable :apparat, "apparat"
    #t.add_executable :coverage, "coverage"
    #t.add_executable :tdsi, "tdsi"
  end
end
