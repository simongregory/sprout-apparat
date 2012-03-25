require 'test_helper'

class StripperTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A Stripper tool" do

    setup do
      @fixtures = File.join fixtures, 'stripper', 'tmp'
      @fixture = "#{@fixtures}/strip-me.swf"

      FileUtils.makedirs @fixtures
      FileUtils.touch @fixture
    end

    teardown do
      remove_file @fixtures
    end

    should "accept input" do
      tool = Apparat::Stripper.new
      tool.input = @fixture
      tool.output = 'stipper/stripped.swf'

      assert_equal "-i #{@fixture} -o stipper/stripped.swf", tool.to_shell
    end

  end

end
