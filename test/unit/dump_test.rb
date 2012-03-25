require 'test_helper'

class DumpTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A Reducer tool" do

    setup do
      @fixtures = File.join fixtures, 'dump', 'tmp'
      @fixture = "#{@fixtures}/dump.swf"

      FileUtils.makedirs @fixtures
      FileUtils.touch @fixture
    end

    teardown do
      remove_file @fixtures
    end

    should "accept input" do
      tool = Apparat::Dump.new
      tool.input = @fixture
      tool.output = 'dump/'
      tool.swf = true
      tool.uml = true
      tool.abc = true
      tool.bc = 'raw'

      assert_equal "-i #{@fixture} -o dump/ -swf -uml -abc -bc raw", tool.to_shell
    end

  end

end
