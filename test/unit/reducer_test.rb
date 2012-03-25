require 'test_helper'

class ReducerTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A Reducer tool" do

    setup do
      @fixtures = File.join fixtures, 'reducer', 'tmp'
      @fixture = "#{@fixtures}/reduce-me.swf"

      FileUtils.makedirs @fixtures
      FileUtils.touch @fixture
    end

    teardown do
      remove_file @fixtures
    end

    should "accept input" do
      tool = Apparat::Reducer.new
      tool.input = @fixture
      tool.output = 'reduced/smaller.swf'
      tool.quality = '0.5'

      assert_equal "-i #{@fixture} -o reduced/smaller.swf -q 0.5", tool.to_shell
    end

  end

end
