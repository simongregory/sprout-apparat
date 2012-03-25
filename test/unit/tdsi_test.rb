require 'test_helper'

class TDSITest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A Reducer tool" do

    setup do
      @fixtures = File.join fixtures, 'tdsi', 'tmp'
      @fixture = "#{@fixtures}/tdsi-me.swf"
      @output = "tdsi/turbo.swf"

      FileUtils.makedirs @fixtures
      FileUtils.touch @fixture
    end

    teardown do
      remove_file @fixtures
    end

    should "accept input" do
      tool = Apparat::TDSI.new
      tool.input = @fixture
      tool.output = @output

      assert_equal "-i #{@fixture} -o #{@output}", tool.to_shell
    end

    should "enable alchemy compiler fixes" do
      tool = Apparat::TDSI.new
      tool.input = @fixture
      tool.output = @output
      tool.fix = true

      assert_equal "-i #{@fixture} -o #{@output} -f", tool.to_shell
    end

    should "inline alchemy operations" do
      tool = Apparat::TDSI.new
      tool.input = @fixture
      tool.output = @output
      tool.alchemy = true

      assert_equal "-i #{@fixture} -o #{@output} -a", tool.to_shell
    end

    should "configure for inlined expansion" do
      tool = Apparat::TDSI.new
      tool.input = @fixture
      tool.output = @output
      tool.inlined = true

      assert_equal "-i #{@fixture} -o #{@output} -e", tool.to_shell
    end

    should "enable macro expansion" do
      tool = Apparat::TDSI.new
      tool.input = @fixture
      tool.output = @output
      tool.macro = true

      assert_equal "-i #{@fixture} -o #{@output} -m", tool.to_shell
    end

    should "set all options" do
      tool = Apparat::TDSI.new
      tool.input = @fixture
      tool.output = @output
      tool.fix = true
      tool.alchemy = true
      tool.inlined = true
      tool.macro = true

      assert_equal "-i #{@fixture} -o #{@output} -f -a -e -m", tool.to_shell
    end
  end

end
