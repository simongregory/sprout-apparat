require 'test_helper'

class StripperTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A Coverage tool" do

    setup do
      @fixtures = File.join fixtures, 'coverage', 'tmp'
      @fixture = "#{@fixtures}/cover-me.swf"

      FileUtils.makedirs @fixtures
      FileUtils.touch @fixture
    end

    teardown do
      remove_file @fixtures
    end

    should "accept input" do
      tool = Apparat::Coverage.new
      tool.input = @fixture
      tool.output = 'coverage/covered.swf'

      assert_equal "-i #{@fixture} -o coverage/covered.swf", tool.to_shell
    end

  end

end
