require 'test_helper'

class ConcreteTest < Test::Unit::TestCase
  include Sprout::TestHelper

  context "A Concrete tool" do

    should "accept input" do
      tool = Apparat::Concrete.new
      tool.input = 'test.swf:/path/to/playerglobal.swc'

      assert_equal "-i test.swf:/path/to/playerglobal.swc", tool.to_shell
    end

  end

end
